//
//  Food.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-07.
//

import CoreLocation

struct Food {
    let name: String
    let description: String
    var price: String
    //var location: CLLocation?
    let place: String
    let distanc: String

    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
       // self.price = dictionary["price"] as? Int ?? 0
        self.place = dictionary["place"] as? String ?? ""
        self.price = dictionary["price"] as? String ?? ""
        self.distanc = dictionary["distance"] as? String ?? ""
    }
}
