//
//  MarvelInfo.swift
//  ilegra-marvel
//
//  Created by Joel de Almeida Souza on 12/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import ObjectMapper

/**
 MarvelInfo extends `Mappable`
 - SeeAlso: `Mappable`
 */
struct MarvelInfo: Mappable{
    ///Int code
    var code: Int
    //String status
    var status: String
    //MarvelData data
    var data: MarvelMap
    /**
     - Parameter map: `Map`
     */
    init?(map: Map) {
        code = (try? map.value("code")) ?? 0
        status = (try? map.value("status")) ?? ""
        data = (try? map.value("data")) ?? MarvelMap(map: map)!
    }
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        data <- map["data"]
    }
}
