//
//  IconCustomTextField.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 10/09/21.
//

import SwiftUI

struct IconCustomTextField: View {
    
    var icon_img:String = ""
    var hint:String = ""
    var var_txt:Binding<String>
    
    init(icon:String,hint:String,bindingString:Binding<String>) {
        self.icon_img = icon
        self.var_txt = bindingString
        self.hint = hint
    }
    
    
    var body: some View {
        
        HStack(){
            if(!self.icon_img.isEmpty){
                left_icon
            }
            VStack(){
                TextField(self.hint, text: self.var_txt)
                Divider().frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 1, maxHeight: 1)
                    .background(Color.gray)
                
            }.padding(.all, 10)
            
        }
        
    }
    
    var left_icon: some View{
            Image(self.icon_img)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
    
}

struct IconCustomTextField_Previews: PreviewProvider {
    @State static var txt:String = ""

    static var previews: some View {
        
        IconCustomTextField(icon: "user2",hint:"hint", bindingString: $txt)//.border(Color.green)
    }
}
