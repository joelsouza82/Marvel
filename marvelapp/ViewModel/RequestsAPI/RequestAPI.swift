//
//  RequestAPI.swift
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import Alamofire

/**
 Class Request
 - Configura SessionManager para requisições a API
 */
class RequestAPI{
    /*
     alamofireManager configura SessionManager para requisições
     - Returns: SessionManager
     */
    let alamofireManager: SessionManager = {
        //Criação das configurações
        let configurarion = URLSessionConfiguration.default
        //Tempo de timeout em milesegundos
        configurarion.timeoutIntervalForRequest = 15000
        configurarion.timeoutIntervalForResource = 15000
        return SessionManager(configuration: configurarion)
    }()
}
