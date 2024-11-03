//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 22/10/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(.easeOut(duration: 1.0), value: animate)
            
            
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(true))
        .foregroundColor(.red)
}
