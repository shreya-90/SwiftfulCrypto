//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 03/11/24.
//

import Foundation
import UIKit

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
