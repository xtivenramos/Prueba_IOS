//
//  ToolbarView.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import Foundation
import SwiftUI

struct ToolbarView: View {
    enum ToolbarType {
        case none
        case only_btback
        case webPos
    }
    
    @EnvironmentObject var navigation: NavigationStack
    
    var style:ToolbarType = .none
    var action:()->Void = {}
    
    init(){
        
    }
    
    init(style:ToolbarType, action:@escaping ()->Void){
        self.style = style
        self.action = action
    }
    
    var body: some View {
        switch style {
            case .only_btback:
                only_backbutton
            case .none:
                none.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            case .webPos:
                webPos.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color("colorPrimary"))
        }
    }
    
    var only_backbutton: some View{
        HStack(){
            btBack
            Text("Prueba Ceiba")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading, 2)
                .padding(.vertical, 20)
                
            Spacer()
        }.background(Color.green.edgesIgnoringSafeArea(.all))
    }
    
    var none: some View{
        HStack(){
            Text("Prueba Ceiba")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading, 12)
                .padding(.vertical, 20)
                
            Spacer()
        }.background(Color.green.edgesIgnoringSafeArea(.all)).padding(.bottom)
    }
    
    var btBack: some View{
        HStack(){
            Image(systemName: "arrowshape.turn.up.left.fill")
                .resizable()
                .scaledToFit()
                //.foregroundColor(.white)
                .frame(width: 30, height: 30, alignment: .center)
                .onTapGesture {
                    self.navigation.unwind()
                }.foregroundColor(.white)
        }.padding(.horizontal, 3)
    }
    
    var webPos: some View{
        
        Button(action:{}){
            Image(systemName: "power").resizable().scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(Color.white)
                .padding(.leading, 12)
            }
    }
    
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView(style:.only_btback, action: {})
    }
}
