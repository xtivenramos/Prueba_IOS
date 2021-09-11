//
//  UserItemView.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import SwiftUI

struct UserItemView: View {
    
    @ObservedObject var modelView: UserItemModelView = UserItemModelView()
    var navigation:NavigationStack
    var user:User
    
    init(usuario: User, nav:NavigationStack){
        self.user = usuario
        self.navigation = nav
    }
    
    var body: some View {
        VStack(){
            HStack(){
                infoUsuario
                Spacer()
            }
            btnPublicacion
        }.background(Color.white).cornerRadius(10)
        
    }
    
    var infoUsuario: some View {
        VStack(alignment: .leading, spacing: 2){
            nombre
            telefono
            email
        }.padding(.horizontal, 10).padding(.vertical, 10)
    }
    
    var nombre: some View {
        HStack(){
            Text(self.user.name).font(.headline).foregroundColor(Color.green)
        }
    }
    
    var telefono: some View {
        HStack(){
            Image(systemName: "phone.fill").padding(.horizontal, 5).foregroundColor(.green)
            Text(self.user.phone).font(.caption)
        }
    }
    
    var email: some View {
        HStack(){
            Image(systemName: "envelope.fill").padding(.horizontal, 5).foregroundColor(.green)
            Text(self.user.email).font(.caption)
        }
    }
    
    var btnPublicacion: some View{
        HStack(){
            Spacer()
            HStack(){
                Button(action: {
                    self.modelView.btnActionShowPosts(user: self.user, nav: self.navigation)
                }, label: {
                    Spacer()
                    Text("VER PUBLICACIONES").font(.footnote)
                }).buttonStyle(buttonWhiteLettersRed())
            }
        }
    }
}

//struct UserItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserItemView()
//    }
//}
