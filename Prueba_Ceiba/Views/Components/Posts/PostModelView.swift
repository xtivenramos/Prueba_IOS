//
//  PostModelView.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation

class PostModelView : ObservableObject {
    
    @Published var user:User
    @Published var posts: PostsModel?
    @Published var error:String = ""
    @Published var loading: Bool = false
    
    init(user: User){
        self.user = user
    }
    
    func getPostsUser(){
        PostUseCase().get_list_posts_user(user: self.user) { posts in
            self.posts = posts
            self.delayClose()
        } onDefault: {_ in
            self.delayClose()
        } onError: { String in
            self.error = String
            self.delayClose()
        }
    }
    
    private func delayClose() {
        // Delay of 7.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loading = false
        }
    }
    
}
