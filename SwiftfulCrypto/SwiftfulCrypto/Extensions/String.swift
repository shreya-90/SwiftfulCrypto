//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 05/11/24.
//

import Foundation


extension String {
    
    var removingHTMLOccurences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
