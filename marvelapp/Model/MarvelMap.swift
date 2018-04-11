//
//  MarvelMap.swift
//
//  Created by Joel de Almeida Souza on 12/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import ObjectMapper


struct MarvelMap: Mappable{
    ///Int offset
    var offset: Int
    ///Int limit
    var limit: Int
    ///Int total
    var total: Int
    ///Int count
    var count: Int
    ///Array [Characters] results
    var results: [Character]
    
    /**
     - Parameter map: `Map`
     */
    init?(map: Map) {
        offset = (try? map.value("offset")) ?? 0
        limit = (try? map.value("offset")) ?? 0
        total = (try? map.value("offset")) ?? 0
        count = (try? map.value("offset")) ?? 0
        results = [(try? map.value("results")) ?? Character(map: map)!]
    }
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        offset <- map["total_count"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}
