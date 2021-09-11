//
//  UsersUseCase.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation

class UsersUseCase{
    
    func get_list_users(
        onSuccess: @escaping (_ resData: UserModel?)-> Void,
        onDefault: @escaping (_ resData: UserModel?)-> Void,
        onError: @escaping (_ resData: String)-> Void
    )
    {
        UserRepository().getUsers_request(onSuccess: onSuccess, onDefault: onDefault, onError: onError)
    }
    
}
