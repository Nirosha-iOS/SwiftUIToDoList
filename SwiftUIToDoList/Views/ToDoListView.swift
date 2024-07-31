//
//  ToDoListView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
  
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack {
                
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
    ToDoListView(userId: "")
}
