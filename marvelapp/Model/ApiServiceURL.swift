//
//  ApiServiceURL.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souz. All rights reserved.
//

import Foundation
import CryptoSwift

class ApiServiceURL{
    // - String path url base para api da marvel
    static let path = "https://gateway.marvel.com/v1/public"
    // - String pathCharacters endpoint v
    static let pathCharacters = "/characters?"
    // - String privateKey api marvel
    static private let privateKey = ""
    // - String publicKey api marvel
    static private let publicKey = ""
    // - Int limit limite de requisições por página
    static let limit = 50
    
    
    /**
     Metodo que retorna uma query string de Dicionário construido para atender da api da marvel
     - Returns: -> String query
                -> string de Dicionário
     */
    static func getCredencial() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }
}
