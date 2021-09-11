//
//  UserItemModelView.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation
import SwiftUI

class UserItemModelView : ObservableObject {
    
    init()
    {
        
    }
    
    func btnActionShowPosts(user: User, nav: NavigationStack){
        nav.advance(AnyView(PostsView(user: user)), tag: .ListPostsView)
    }
}
