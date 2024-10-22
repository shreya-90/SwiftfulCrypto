//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 20/10/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                .navigationBarHidden(true)
                
            }
        }
    }
}
