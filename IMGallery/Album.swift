//
//  Album.swift
//  IMGallery
//
//  Created by Venkatesh on 16/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import Foundation
import ObjectMapper

struct Album : Mappable  {
    var is_album : Bool?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
    }
}

struct Image : Mappable  {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
    }
}
