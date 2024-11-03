//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 20/10/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {

    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]

    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                .navigationBarHidden(true)
                
            }.environmentObject(vm)
        }
    }
}
