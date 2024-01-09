//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import Foundation
import FirebaseFirestore

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete todo list item
    /// - Parameter id: item id
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId)
            .collection("todos").document(id)
            .delete()
    }
}
