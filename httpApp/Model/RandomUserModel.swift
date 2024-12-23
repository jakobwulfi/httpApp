//
//  RandomUserModel.swift
//  httpApp
//
//  Created by dmu mac 31 on 18/09/2024.
//

import Foundation

struct RandomUserResult: Decodable {
    let results: [User]
}

struct User: Decodable {
    
    let gender: Gender
    let name: Name
    
    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }
    
    var fullName: String {
        return "\(name.title) \(name.first) \(name.last)"
    }
    
    enum Gender: String, Decodable {
        case male
        case female
    }
    
    let picture: Picture
    
    struct Picture: Decodable {
        let large: URL
        let thumbnail: URL
    }
}
