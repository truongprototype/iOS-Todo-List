//
//  RegisterView.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .mint)
            
            // Form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                TLButton(title: "Sign Up", background: .green, action: {
                    viewModel.register()
                })
                    .padding(.vertical, 20)
            }.offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
