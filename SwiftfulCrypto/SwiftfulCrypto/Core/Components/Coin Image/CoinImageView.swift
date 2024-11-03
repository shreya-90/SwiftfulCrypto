//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 24/10/24.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
                .foregroundColor(Color.theme.secondaryText)
        }
//        Circle()
//            .frame(width: 30, height: 30)
        
    }
}

struct CoinImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
                .previewLayout(.sizeThatFits)
    }
   
}
