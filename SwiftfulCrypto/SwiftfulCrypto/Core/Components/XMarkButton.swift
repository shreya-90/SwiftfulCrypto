//
//  XMark.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 30/10/24.
//

import SwiftUI

struct XMarkButton: View {
    
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: {
            dismiss()
            print("xmark dismiss")
        },
        label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
