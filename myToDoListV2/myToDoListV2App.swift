//
//  myToDoListV2App.swift
//  myToDoListV2
//
//  Created by Alem Nabiyev on 11/10/24.
//

import SwiftUI

@main
struct myToDoListV2App: App {
    
  @StateObject  var listViewModel: ListViewModel = ListViewModel() 
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
