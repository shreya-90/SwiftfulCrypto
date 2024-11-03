//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 30/10/24.
//

import Foundation
import Combine


class MarketDataService {
    
    @Published var marketData: MarketDataModel?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getStatistics()
    }
    
    func getStatistics() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        
        marketDataSubscription = NetowrkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetowrkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
            
        
    }
}
