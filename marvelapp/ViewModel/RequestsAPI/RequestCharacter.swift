//
//  RequestCharacter.swift
//  ilegra-marvel
//
//  Created by Joel de Almeida Souza on 11/04/2018.
//  Copyright © 2018 Joel de Almeida Souza. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


class RequestCharacter: RequestAPI{
    /**
     func loadCharacters retorna Model ResponseMarvelInfo
     
     - Parameters:
     - name: Optional para busca por nome de personagem
     - SeeAlso: `ResponseMarvelInfo`
     - page: Número da página em Int
     - completion: @escaping `ResponseMarvelInfo`
    
     */
    func loadCharacters(name: String?, page: Int = 0, onComplete: @escaping (_ response: ResponseMarvelInfo) -> Void){
        let offset = page * ApiServiceURL.limit
        
        var queryParams: [String:String] = ["offset": String(offset), "limit": String(ApiServiceURL.limit)]
        if let name = name, !name.isEmpty{
            queryParams["nameStartsWith"] = name.replacingOccurrences(of: " ", with: "")
        }
        
        let url = ApiServiceURL.path + ApiServiceURL.pathCharacters + queryParams.queryString! + ApiServiceURL.getCredencial()
        Alamofire.request(url).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            switch response.result{
                case .success(let value):
                    let resultValue = value as? [String: Any]
                    if statusCode == 200{
                        let model = Mapper<MarvelInfo>().map(JSONObject:resultValue)
                        onComplete(.success(model: model!))
                    }
                case .failure(let error):
                    //Status de erro
                    let errorCode = error._code
                    if errorCode == -1009 {
                        let erro = ErrorServer(statusCode: errorCode, msgError: error.localizedDescription)
                        onComplete(.noConnection(description: erro))
                    } else if errorCode == -1001 {
                        let erro = ErrorServer(statusCode: errorCode, msgError: error.localizedDescription)
                        onComplete(.timeOut(desciption: erro))
                    }
            }
        }
    }
}
