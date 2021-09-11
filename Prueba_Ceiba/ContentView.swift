//
//  ContentView.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 9/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var navigation : NavigationStack
    
    init(){
        self.navigation = NavigationStack(NavigationItem(view: AnyView(UsersView()), tag: .ListUsersView))
    }

    var body: some View {
        NavigationHost()
            .environmentObject(self.navigation)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
