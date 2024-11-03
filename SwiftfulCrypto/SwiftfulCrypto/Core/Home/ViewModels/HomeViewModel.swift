//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 22/10/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var isLoading = false
    @Published var sortOption: SortOption = .holdings
    
    private var cancellables =  Set<AnyCancellable>()
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init() {
        addSubscribers()
    }
    
    
    func addSubscribers() {
                
        //updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSort)
            .sink { [weak self] returnedCoins in
                print("search text + allcoins subscription")
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
        //updates portfolioCoins -  
        //We want [CoinModels] - we are listening to Core data here ( the portfolio entities inside allCoins )
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfoliocpins)
            .sink { [weak self] returnedCoins in
                print("portfolio entity subscription")
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
        
        
        //updates market Data
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .receive(on: DispatchQueue.main)
            .map(getStatisticModelData)
            .sink { [weak self] returnedStats in
                print("market data subscription")
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
        
        
//        $allCoins
//            .combineLatest($sortOption)
//            .map(filterAndSort)
//            .sink { [weak self] returnedCoins in
//                print("sort option subscription")
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getStatistics()
        HapticManager.notification(type: .success)
    }
    
    private func mapAllCoinsToPortfoliocpins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    private func getStatisticModelData(marketDataModel: MarketDataModel?, portfoliocoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else { return [] }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        stats.append(marketCap)
        
        let volume = StatisticModel(title: "24H Volume", value: data.volume)
        stats.append(volume)
        
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDoinance)
        stats.append(btcDominance)
        
        let portfolioValue = portfolioCoins
            .map({ $0.currentHoldingsValue })
            .reduce(0, +)
        
        
        let previousValue = portfolioCoins
            .map { coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentageChange = (coin.priceChangePercentage24H ?? 0) / 100.0
                let previousValue = currentValue / (1 + percentageChange)
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue)  * 100
        
        let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(portfolio)
        
        return stats
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowerCasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowerCasedText) ||
            coin.symbol.lowercased().contains(lowerCasedText) ||
            coin.id.lowercased().contains(lowerCasedText)
        }
    }
    
    private func filterAndSort(text: String, coins: [CoinModel],sort: SortOption) -> [CoinModel] {
        var updatedCoins = filterCoins(text: text, coins: coins)
        sortCoins(sort: sort, coins: &updatedCoins)
        return updatedCoins
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]) {
        switch sort {
        case .rank, .holdings:
             coins.sort{ $0.rank < $1.rank }
        case .rankReversed, .holdingsReversed:
             coins.sort { $0.rank > $1.rank }
        case .price:
             coins.sort { $0.currentPrice > $1.currentPrice }
        case .priceReversed:
             coins.sort { $0.currentPrice < $1.currentPrice }
        }
    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        // only by Holdings or reverseHoldings
        print("sort by holdings called")
        switch sortOption {
        case .holdings:
            return coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue } )
        case .holdingsReversed:
            return coins.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue } )
        default:
            return coins
       
        }
    }
    
}

