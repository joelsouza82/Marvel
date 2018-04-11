//
//  Thumbnail.swift
//  ilegra-marvel
//
//  Created by Joel de Almeida Souza on 12/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import ObjectMapper

struct Thumbnail: Mappable{

    var path: String
    var ext: String
    /**
     - Parameter map: `Map`
     */
    init?(map: Map){
        path = (try? map.value("path")) ?? ""
        ext = (try? map.value("extension")) ?? ""
    }
    
    /**
     - Parameter map: `Map`
     */
    mutating func mapping(map: Map) {
        path <- map["path"]
        ext <- map["extension"]
    }
    /**
     Concatena path com ext para formar a url da imagem
     - Returns: String url com extensão da imagem
     */
    func getUrl() -> String{
        return path + "." + ext
    }
}
