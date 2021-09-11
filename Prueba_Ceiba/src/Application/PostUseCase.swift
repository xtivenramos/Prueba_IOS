//
//  PostUseCase.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation

class PostUseCase {
    
    func get_list_posts_user(
        user:User,
        onSuccess: @escaping (_ resData: PostsModel?)-> Void,
        onDefault: @escaping (_ resData: PostsModel?)-> Void,
        onError: @escaping (_ resData: String)-> Void
    )
    {
        PostsRepository().getPostsUser_request(user: user, onSuccess: onSuccess, onDefault: onDefault, onError: onError)
    }
}
