//
//  SwiftUIToDoListApp.swift
//  SwiftUIToDoList
//
//  Created by KISHANI on 26/07/24.
//

import SwiftUI
import FirebaseCore
@main
struct SwiftUIToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
