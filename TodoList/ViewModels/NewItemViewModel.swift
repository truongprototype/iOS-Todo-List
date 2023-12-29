//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var showingError = false
    
    init() {}
    
    func save() {
        showingError = false
        guard validate() else {
            showingError = true
            return
        }
        
        // Save
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !title.isEmpty else {
            errorMessage = "Title must be filled."
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            errorMessage = "Due date must be newer or equal today."
            return false
        }
        
        return true
    }
}
