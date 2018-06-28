//
//  Product.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import Foundation

class Product {
    
    var id : Int?
    var title : String?
    var description : String?
    var price : Double?
    var discount : Int?
    var size : String?
    var color : String?
    var stock : String?
    var latitude : String?
    var longitude : String?
    var popular : Int?
    var created_at : String?
    var updated_at : String?
    var admin_user_id : Int?
    var category : [String:Any]?
    var member_id : Int?
    var weight : Int?
    var name_of_store : String?
    var image_name : Array<Any>?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? nil
        self.title = data["title"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.price = data["price"] as? Double ?? nil
        self.discount = data["discount"] as? Int ?? nil
        self.size = data["size"] as? String ?? ""
        self.color = data["color"] as? String ?? ""
        self.stock = data["stock"] as? String ?? ""
        self.latitude = data["latitude"] as? String ?? ""
        self.longitude = data["longitude"] as? String ?? ""
        self.popular = data["popular"] as? Int ?? nil
        self.created_at = data["created_at"] as? String ?? ""
        self.updated_at = data["updated_at"] as? String ?? ""
        self.admin_user_id = data["admin_user_id"] as? Int ?? nil
        self.category = data["category"] as? [String:Any] ?? nil
        self.member_id = data["member_id"] as? Int ?? nil
        self.weight = data["weight"] as? Int ?? nil
        self.name_of_store = data["name_of_store"] as? String ?? ""
        self.image_name = data["image_name"] as? Array<Any> ?? nil
    }
    
}
