//
//  Album.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import Foundation
import ObjectMapper

struct APIData : Mappable {
    var data : [Album]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

struct Album : Mappable {
    var isAlbum : Bool?
    var link : String?
    var images : [Image]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isAlbum <- map["is_album"]
        if (isAlbum!) {
            images <- map["images"]
        } else {
            link <- map["link"]
        }
    }
}

struct Image : Mappable {
    var link : String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        link <- map["link"]
    }
}

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
