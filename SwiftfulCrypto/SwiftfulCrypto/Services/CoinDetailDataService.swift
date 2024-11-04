//
//  CoinDetailDataService.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 04/11/24.
//

import Foundation
import Combine


class CoinDetailDataService {
    
    var coin: CoinModel
    @Published var coinDetails: CoinDetailModel?
    var coinDetailSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        
        coinDetailSubscription = NetowrkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetowrkingManager.handleCompletion, receiveValue: { [weak self] coinDetails in
                self?.coinDetails = coinDetails
                self?.coinDetailSubscription?.cancel()
            })
            
        
    }
}
