//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 04/11/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
       addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailDataService.$coinDetails
            .sink { returnedCoinDetails in
                print("RECEIVED COIN DETAIL DATA")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
    
    
}
