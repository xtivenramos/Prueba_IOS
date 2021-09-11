//
//  UsersModelView.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation

class UsersModelView: ObservableObject {
    
    @Published var users : UserModel? = UserRepository().getUsuarios()
    @Published var usersFilter: UserModel = UserModel()
    @Published var error: String = ""
    @Published var loading: Bool = false
    @Published var find:String = "" {
        didSet{
            self.dofilter(find:find)
        }
    }
    
    @Published var isFiltered:Bool = false
    init()
    {
        
    }
    
    func getUsuariosList(){
        UsersUseCase().get_list_users { response in
            self.users = response
            self.delayClose()
        } onDefault: { response in
            //
            self.delayClose()
        } onError: { error in
            self.error = error
            self.delayClose()
        }

    }
    
    func dofilter(find: String){
        if find != "" {
            self.isFiltered = true
            let filtered = self.users?.filter({ User in
                let nombre = User.name.lowercased()
                return nombre.contains(find.lowercased())
            })
            self.usersFilter = filtered ?? UserModel()
        }else{
            self.isFiltered = false
        }
    }
    
    private func delayClose() {
        // Delay of 7.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loading = false
        }
    }
}
