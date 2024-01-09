//
//  TLButton.swift
//  TodoList
//
//  Created by MacintoshHD on 15/12/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                
                if #available(iOS 16.0, *) {
                    Text(title).foregroundStyle(.white).bold()
                } else {
                    Text(title).foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    TLButton(title: "Button", background: .blue, action: {})
}
