//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 25/10/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
