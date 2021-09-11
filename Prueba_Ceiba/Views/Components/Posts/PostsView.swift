//
//  PostsView.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import SwiftUI

struct PostsView: View {
    
    @EnvironmentObject var navigation: NavigationStack
    @ObservedObject var modelview:PostModelView
    
    init(user: User){
        self.modelview = PostModelView(user: user)
    }
    
    var body: some View {
        ZStack(){
            VStack(){
                ToolbarView(style: .only_btback, action: {})
                ScrollView{
                    list
                }
            }
            
            if self.modelview.loading {
                GeometryReader(content: { _ in
                    LoaderView()
                }).background(Color.black.opacity(0.45).edgesIgnoringSafeArea(.all))
            }
        }.background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
        .onAppear{
            self.modelview.loading.toggle()
            self.modelview.getPostsUser()
        }
    }
    
    var list: some View {
        VStack(){
            if (self.modelview.posts?.count ?? 0) > 0 {
                listPosts
            }else{
                HStack(){
                    Spacer()
                    Text("List is Empty").font(.footnote).foregroundColor(.gray.opacity(0.8))
                    Spacer()
                }
            }
        }
    }
    
    
    var listPosts: some View {
        VStack(){
            ForEach((self.modelview.posts ?? []), id:\.self){ element in
                Post_ItemView(post: element)
            }
        }
    }
}

//struct PostsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostsView()
//    }
//}
