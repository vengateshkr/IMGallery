//
//  Album.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import Foundation
import ObjectMapper


// MARK: - APIdata model

struct APIData : Mappable {
    var data : [Album]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

// MARK: - Album model

struct Album : Mappable {
    var isAlbum : Bool?
    var link : String?
    var images : [Image]?
    var type : String?
    var gifv : String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isAlbum <- map["is_album"]
        if (isAlbum!) {
            images <- map["images"]
        } else {
            link <- map["link"]
            type <- map["type"]
            gifv <- map["gifv"]
        }
    }
}

// MARK: - Image model

struct Image : Mappable {
    var link : String?
    var type : String?
    var gifv : String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        link <- map["link"]
        type <- map["type"]
        gifv <- map["gifv"]
    }
}

// MARK: - class and method to load album from JSON

class APIDataModel {
    
    class func loadAlbumModel(data: Data!) -> APIData? {
        
        do {
            let json  = try JSONSerialization.jsonObject(with: data, options: [])
            let product = Mapper<APIData>().map(JSONObject: json)
            return product!
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
