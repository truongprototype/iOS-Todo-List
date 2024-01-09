//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

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
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
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
