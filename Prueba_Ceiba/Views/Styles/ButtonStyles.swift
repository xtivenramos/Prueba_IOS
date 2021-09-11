//
//  ButtonStyles.swift
//  Prueba_Ceiba
//
//  Created by Virgilio Salgado on 11/09/21.
//

import Foundation
import SwiftUI


struct buttonWhiteLettersRed: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.green)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, idealHeight: 44, maxHeight: 44, alignment: .center)
            .background(Color.white)
            //.padding(12)
    }
    
}
