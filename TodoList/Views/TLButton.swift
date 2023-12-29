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
                Text(title).foregroundStyle(.white).bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Button", background: .blue, action: {})
}
