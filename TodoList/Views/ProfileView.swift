//
//  ProfileView.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
