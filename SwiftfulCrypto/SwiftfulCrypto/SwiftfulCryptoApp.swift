//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 20/10/24.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
