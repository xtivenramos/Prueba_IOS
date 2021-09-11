//
//  LoaderView.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 10/09/21.
//

import SwiftUI

struct LoaderView: View {
    
    @State var animate:Bool = false
    @State var message:String = "Please wait..."
    
    init(){
        
    }
    
    init(message:String)
    {
        self.message = message
    }
    
    var body: some View {
        VStack(){
            Spacer()
            HStack(){
                Spacer()
                VStack(){
                    Circle()
                        .trim(from: 0.1, to: 0.8)
                        .stroke(AngularGradient(gradient: .init(colors: [.green, .yellow]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .frame(width: 45, height: 45)
                        .rotationEffect(.init(degrees: self.animate ? 360:0))
                        .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                    
                    Text(self.message).padding(.top)
                }.padding(20)
                .background(Color.white)
                .cornerRadius(15)
                .onAppear{
                    self.animate.toggle()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
