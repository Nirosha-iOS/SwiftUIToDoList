//
//  ContentView.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {

            accountView
            
           
        }else {
            LoginView()
        }
        
       
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                       
                }
                
            UserProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
