//
//  CharacterURL.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import ObjectMapper

struct CharacterURL: Mappable{
    
    ///String url
    var url: String
    ///String type
    var type: String
   
    
    init?(map: Map){
        url = (try? map.value("url")) ?? ""
        type = (try? map.value("type")) ?? ""
       
    }
    
    
    mutating func mapping(map: Map) {
        url <- map["url"]
        type <- map["type"]
        
    }
}
