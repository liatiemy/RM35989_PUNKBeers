//
//  Beer.swift
//  RM36989
//
//  Created by Lia Tiemy on 11/19/17.
//  Copyright © 2017 Lia Tiemy. All rights reserved.
//

import Foundation
class Beer {
    
    var image_url: String
    var name: String
    var tagline: String
    var abv: Double
    var ibu: Double
    var description: String
    var id: Int?
    
    init(image_url: String, name: String, tagline: String, abv: Double, ibu: Double, description: String) {
        self.image_url = image_url
        self.name = name
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.description = description
    }
}

