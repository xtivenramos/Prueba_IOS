//
//  UserModel.swift
//  Prueba_Ingreso
//
//  Created by Virgilio Salgado on 9/09/21.
//

import Foundation

// MARK: - User
struct User: Codable, Hashable {
    var id: Int {idUser}
    let idUser: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    enum CodingKeys: String, CodingKey{
        case idUser = "id"
        case name,username,email,address,phone,website,company
    }
}

// MARK: - Address
struct Address: Codable, Hashable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable, Hashable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name, catchPhrase, bs: String
}

typealias UserModel = [User]
