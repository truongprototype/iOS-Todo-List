//
//  LoginViewModel.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Login
        Auth.auth().signIn(withEmail: email, password: password, completion: {_, error in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? ""
                return
            }
        })
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email"
            return false
        }
        
        return true
    }
}
