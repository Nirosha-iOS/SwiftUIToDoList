//
//  ToDoListView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoListItemModel]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        _viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack {
                List(items){ item in
                    SingleItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.fnDeleteItem(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("Task List")
            .toolbar{
                Button{
                    
                    viewModel.showingNewItemView = true
                    //Action
                    
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView( newiItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "DnYKsIM2XpUG2XDz6WomJamMrQs2")
}
