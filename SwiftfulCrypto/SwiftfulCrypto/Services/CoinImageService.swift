//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 24/10/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, foldername: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        
        print("Download images now!!")
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetowrkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetowrkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                
                guard let self = self, let downloadedImage = returnedImage else  { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                
                
                self.fileManager.saveImage(image: downloadedImage, imageName: imageName, folderName: self.folderName)
            })
    }
}
