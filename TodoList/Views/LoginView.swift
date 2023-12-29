//
//  LoginView.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Todo List", subtitle: "Get things done", angle: 15, background: .cyan)
                
                // Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundStyle(.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                    TLButton(title: "Login", background: .blue, action: {
                        viewModel.login()
                    }).padding(.vertical, 20)
                }.offset(y: -50)
                
                // Footer
                VStack {
                    Text("New account here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }.padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
