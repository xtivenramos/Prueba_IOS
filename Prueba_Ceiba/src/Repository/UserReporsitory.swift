//
//  UserReporsitory.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation
import UIKit
import Alamofire

class UserRepository:  ObservableObject {
    
    private let key:String = "KeyUsuariosList"
    private let localStorage = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    @Published var usuarios:UserModel?
    
    public func getUsuarios()->UserModel{
        self.syncronize()
        if let usuarios:UserModel = self.usuarios {
            return usuarios
        }
        return UserModel()
    }
    
    private func syncronize(){
        self.usuarios = getUsuariosLocal()
        getUsers_request(onSuccess: {_ in }, onDefault: {_ in}, onError: {_ in})
    }
    
    public func updateUsuarios(usuarios:UserModel){
        self.saveUsuariosLocal(usuarios: usuarios)
        self.usuarios = usuarios;
    }

    private func saveUsuariosLocal(usuarios:UserModel){
        if let encodedData = try? encoder.encode(usuarios){
            localStorage.set(encodedData, forKey: self.key)
        }
    }
    
    private func getUsuariosLocal()->UserModel{

        if let data = localStorage.value(forKey: self.key) as? Data{
            do {
                let res: UserModel =  try JSONDecoder().decode(UserModel.self ,from: data)
                print(res)
                return res
               } catch let error {
                   print(error)
               }
        }
        return UserModel()
    }
    
    func getUsers_request(
        onSuccess: @escaping (_ resData: UserModel?)-> Void,
        onDefault: @escaping (_ resData: UserModel?)-> Void,
        onError: @escaping (_ resData: String)-> Void
    )
    {
        print("--- getUsers_request ----")
        AF.request(Connections.ruta+"users",
                   method: .get,
                   encoding: URLEncoding.default
        ).responseString { response in
            print(response)
            switch response.result {
            case .success:
                print("--- getUsers_request success ----")
                switch response.response?.statusCode{
                case 200:
                    do{
                        let resp:UserModel = try JSONDecoder().decode(UserModel.self, from: response.data!)
                        print(resp)
                        self.updateUsuarios(usuarios: resp)
                        onSuccess(resp)
                    }catch let error{
                        print(error)
                        onError(error.localizedDescription)
                    }
                default:
                    do{
                        let resp:UserModel = try JSONDecoder().decode(UserModel.self, from: response.data!)
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
