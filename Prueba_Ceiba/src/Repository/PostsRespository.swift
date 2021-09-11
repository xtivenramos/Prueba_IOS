//
//  PostsRespository.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation
import UIKit
import Alamofire

class PostsRepository{
    
    func getPostsUser_request(
        user:User,
        onSuccess: @escaping (_ resData: PostsModel?)-> Void,
        onDefault: @escaping (_ resData: PostsModel?)-> Void,
        onError: @escaping (_ resData: String)-> Void
    )
    {
        let parameters = [
            "userId": user.idUser
        ]
        
        print("--- getPostsUser_request ----")
        AF.request(Connections.ruta+"posts",
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default
        ).responseString { response in
            print(response)
            switch response.result {
            case .success:
                print("--- getPostsUser_request success ----")
                switch response.response?.statusCode{
                case 200:
                    do{
                        let resp:PostsModel = try JSONDecoder().decode(PostsModel.self, from: response.data!)
                        print(resp)
                        onSuccess(resp)
                    }catch let error{
                        print(error)
                        onError(error.localizedDescription)
                    }
                default:
                    do{
                        let resp:PostsModel = try JSONDecoder().decode(PostsModel.self, from: response.data!)
                        print(resp)
                        onDefault(resp)
                    }catch let error{
                        print(error)
                        onError(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error)
                onError(error.localizedDescription)
            }
        }
    }
}
