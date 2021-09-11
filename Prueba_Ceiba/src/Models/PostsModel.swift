//
//  PostsModel.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 9/09/21.
//

import Foundation

// MARK: - PostsModelElement
struct PostsModelElement: Codable, Hashable {
    var id:Int {idPost}
    let userID, idPost: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case idPost = "id"
        case title, body
    }
}

typealias PostsModel = [PostsModelElement]
