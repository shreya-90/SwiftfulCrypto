//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 24/10/24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    
    static let instance = LocalFileManager()
    private init() {}
    
    func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder.")
            } catch let error {
                print("Error creating folder \(error)")
            }
        }
            
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //getpath for image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        //save image to path
        do {
            try data.write(to: url)
        } catch(let error) {
            print("Error saving image. \(error)")
        }

    }
    
    func getImage(imageName: String, foldername: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, folderName: foldername),
            FileManager.default.fileExists(atPath: url.path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
        
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
