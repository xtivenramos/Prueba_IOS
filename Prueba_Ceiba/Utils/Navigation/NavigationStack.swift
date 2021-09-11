//
//  NavigationStack.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 9/09/21.
//

import Foundation
import SwiftUI

final class NavigationStack: ObservableObject
{
    enum FlagType{
        case singleInTop
        case clearTop
    }
    
    @Published var viewStack : [NavigationItem] = []
    @Published var currentView: NavigationItem

    init(_ currentView: NavigationItem){
        self.currentView = currentView
    }
    
    //Regresar a la vista anterior
    func unwind(){
        if viewStack.count == 0{
            return
        }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    //Recibe un navigationItem
    func advance(_ view: NavigationItem)
    {
        viewStack.append(currentView)
        currentView = view
    }
    
    //Recibe una view Easier
    func advance(_ anyview:AnyView, tag: Views)
    {
        viewStack.append(currentView)
        let newView: NavigationItem = NavigationItem(view: anyview, tag: tag)
        currentView = newView
    }
    
    func advanceNewTask(_ view:NavigationItem){
        viewStack.removeAll()
        viewStack.append(currentView)
        currentView = view
    }
    
    func advance(_ anyview: AnyView, tag: Views, flag: FlagType)
    {
        switch flag {
        case .singleInTop:
            let newView:NavigationItem = NavigationItem(view: anyview, tag: tag)
            let index = viewStack.lastIndex { element -> Bool in
                return element.tag == newView.tag
            }
            if index != nil {
                viewStack.remove(at: index!)
            }
            currentView = newView
        case .clearTop:
            viewStack.append(currentView)
            let newView:NavigationItem = NavigationItem(view:anyview, tag:tag)
            let index = viewStack.lastIndex { element -> Bool in
                return element.tag == newView.tag
            }
            if index != nil{
                let range = index!...(viewStack.count-1)
                viewStack.removeSubrange(range)
            }
            currentView = newView
        }
    }
    
    func home()
    {
        //
    }
    
    
}

struct NavigationItem{
    var view: AnyView
    var tag: Views
}

struct NavigationHost: View
{
    @EnvironmentObject var navigation:NavigationStack
    
    var body: some View {
        self.navigation.currentView.view
    }
}
