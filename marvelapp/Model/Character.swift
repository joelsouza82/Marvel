//
//  Character.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation

import ObjectMapper

// Model dos personagens
struct Character: Mappable{
    //Int id
    var id: Int
    //String name
    var name: String
    //String description
    var description: String
    
    
    //Thumbnail thumbnail
    var thumbnail: Thumbnail
    //Array CharacterURL
    var urls: [CharacterURL]
    

    init?(map: Map){
        id = (try? map.value("id")) ?? 0
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        thumbnail = (try? map.value("thumbnail")) ?? Thumbnail(map: map)!
        urls = [(try? map.value("urls")) ?? CharacterURL(map: map)!]
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        urls <- map["urls"]
    }
}
