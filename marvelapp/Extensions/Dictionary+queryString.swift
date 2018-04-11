//
//  Dictionary+queryString.swift
//  ilegra-marvel
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation

/**
extension Dictionary
 */
extension Dictionary {
    ///Variável verifica e retorna Dictionary em formato de query string
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
