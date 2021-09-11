//
//  PostItemView.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import SwiftUI

struct Post_ItemView: View {
    
    var post: PostsModelElement
    
    init(post: PostsModelElement){
        self.post = post
    }
    
    var body: some View {
        HStack(){
            item_post
            Spacer()
        }.background(Color.white).cornerRadius(10).padding(.vertical, 3).padding(.horizontal, 5)
    }
    
    var item_post: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text(self.post.title).font(.headline).foregroundColor(Color.green).padding(.bottom, 5)
            Text(self.post.body).font(.footnote)
        }).padding(.leading, 10)
        .padding(.vertical, 5)
    }
    
}

//struct Post_ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        Post_ItemView()
//    }
//}
