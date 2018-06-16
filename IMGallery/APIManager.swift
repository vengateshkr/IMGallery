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

    class func fetchAPI(responseHandler: @escaping (Data?,Error?) -> Void) {
        
        let header = ["Authorization": Constants.clientID]
        let apiUrl = URL(string: Constants.urlStr)!
        
        Alamofire.request(apiUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            switch(response.result) {
            case .success :
                responseHandler(response.data,nil)
            case .failure(let error) :
                responseHandler(nil,error)
            }
        }
    }
}
