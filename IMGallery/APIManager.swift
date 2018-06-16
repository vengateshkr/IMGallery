//
//  APIManager.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    func fetchAPI(responseHandler: @escaping (Any?,Error?) -> Void) {
        
        let header = ["Authorization": Constants.clientID]
        let apiUrl = URL(string: Constants.urlStr)!
        
        Alamofire.request(apiUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            switch(response.result) {
            case .success(let data) :
                responseHandler(data,nil)
            case .failure(let error) :
                responseHandler(nil,error)
            }
        }
    }
}
