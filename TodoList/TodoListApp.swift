//
//  TodoListApp.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
