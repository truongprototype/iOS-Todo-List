//
//  TodoItemViewModel.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var updatedItem = item
        updatedItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid)
            .collection("todos").document(updatedItem.id)
            .setData(updatedItem.asDictionary())
    }
}
