//
//  NewItemView.swift
//  TodoList
//
//  Created by MacintoshHD on 12/12/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item").font(.system(size: 32)).bold()
                .padding(.top)
            
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .pink) {
                    viewModel.save()
                    if viewModel.validate() {
                        isPresented = false
                    }
                }.padding(.vertical)
            }
            .alert(isPresented: $viewModel.showingError) {
                Alert(title: Text(viewModel.errorMessage))
            }
        }
    }
}

#Preview {
    NewItemView(isPresented: Binding(get: { true }, set: { _ in }))
}
