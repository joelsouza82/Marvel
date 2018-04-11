//
//  ResponsesAPI.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation

/**
 Response ResponseMarvelInfo
 - noConnection: Erro de conexão
 - success:  ResponseMarvelInfo
 - serverError: Erro de servidor
 - timeOut: Erro de TimeOut
 */
enum ResponseMarvelInfo{
    case noConnection(description: ErrorServer)
    case success(model: MarvelInfo)
    case serverError(description: ErrorServer)
    case timeOut(desciption: ErrorServer)
}


enum ResponseCharacter{
    case success(model: [Character])
    case serverError(description: ErrorServer)
    case timeOut(desciption: ErrorServer)
    case noConnection(description: ErrorServer)
}
