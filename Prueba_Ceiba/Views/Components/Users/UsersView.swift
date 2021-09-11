//
//  UsersView.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 9/09/21.
//

import SwiftUI

struct UsersView: View {
    
    @EnvironmentObject var navigation:NavigationStack
    @ObservedObject var modelview:UsersModelView = UsersModelView()
    
    init(){
        
    }
    
    var body: some View {
        ZStack(alignment: .center){
            VStack(){
                ToolbarView()
                buscado
                ScrollView{
                    listUsers
                }
                Spacer()
            }
            
            if self.modelview.loading {
                GeometryReader(content: { _ in
                    LoaderView()
                }).background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all))
            }
            
        }.background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        .onAppear{
            self.modelview.loading.toggle()
            self.modelview.getUsuariosList()
        }
    }
    
    var buscado: some View {
        HStack(){
            Spacer()
            TextField("Buscar", text: self.$modelview.find).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
    }
    
    var listUsers: some View {
        VStack(){
            if self.modelview.isFiltered {
                usersFilter
            }else{
                users
            }
        }
    }
    
    var usersFilter: some View {
        VStack(){
            if self.modelview.usersFilter.count != 0 {
                ForEach((self.modelview.usersFilter), id:\.self){ element in
                    HStack(){
                        UserItemView(usuario: element, nav: self.navigation)
                        Spacer()
                    }.padding(.horizontal, 8)
                }
            }else{
                Spacer()
                Text("List is empty").font(.footnote).foregroundColor(.gray.opacity(0.5))
                Spacer()
            }
            
        }
    }
    
    var users: some View {
        VStack(){
            ForEach((self.modelview.users ?? []), id:\.self){ element in
                HStack(){
                    UserItemView(usuario: element, nav: self.navigation)
                    Spacer()
                }.padding(.horizontal, 8)
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
