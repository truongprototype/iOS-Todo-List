//
//  ContentView.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId).tabItem {
                Label("Home", systemImage: "house")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
