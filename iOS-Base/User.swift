//
//  User.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject, NSCoding {
    
    var id : Int?
    var name : String?
    var email : String?
    var address : String?
    var gender : String?
    var latitude : Double?
    var longitude : Double?
    var birthday : String?
    var company_name : String?
    var phone_number : String?
    var authentication_token : String?
    var created_at : String?
    var updated_at : String?
    var profile_picture : [String:Any]?
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? nil
        self.name = data["name"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
        self.gender = data["gender"] as? String ?? ""
        self.latitude = data["latitude"] as? Double ?? nil
        self.longitude = data["longitude"] as? Double ?? nil
        self.birthday = data["birthday"] as? String ?? ""
        self.company_name = data["company_name"] as? String ?? ""
        self.phone_number = data["phone_number"] as? String ?? ""
        self.authentication_token = data["authentication_token"] as? String ?? ""
        self.created_at = data["created_at"] as? String ?? ""
        self.updated_at = data["updated_at"] as? String ?? ""
        self.profile_picture = data["profile_picture"] as? [String:Any] ?? nil
    }
    
    /*** 
        Using encoded data to be available stored in NSUserDefaults
        check DataManager for implementation
     ***/
    
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeObject(forKey: "id") as? Int ?? nil
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.email = decoder.decodeObject(forKey: "email") as? String ?? ""
        self.address = decoder.decodeObject(forKey: "address") as? String ?? ""
        self.gender = decoder.decodeObject(forKey: "gender") as? String ?? ""
        self.latitude = decoder.decodeObject(forKey: "latitude") as? Double ?? nil
        self.longitude = decoder.decodeObject(forKey: "longitude") as? Double ?? nil
        self.birthday = decoder.decodeObject(forKey: "birthday") as? String ?? ""
        self.company_name = decoder.decodeObject(forKey: "company_name") as? String ?? ""
        self.phone_number = decoder.decodeObject(forKey: "phone_number") as? String ?? ""
        self.authentication_token = decoder.decodeObject(forKey: "authentication_token") as? String ?? ""
        self.created_at = decoder.decodeObject(forKey: "created_at") as? String ?? ""
        self.updated_at = decoder.decodeObject(forKey: "updated_at") as? String ?? ""
        self.profile_picture = decoder.decodeObject(forKey: "profile_picture") as? [String:Any] ?? nil
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(email, forKey: "email")
        coder.encode(address, forKey: "address")
        coder.encode(gender, forKey: "gender")
        coder.encode(latitude, forKey: "latitude")
        coder.encode(longitude, forKey: "longitude")
        coder.encode(birthday, forKey: "birthday")
        coder.encode(company_name, forKey: "company_name")
        coder.encode(phone_number, forKey: "phone_number")
        coder.encode(authentication_token, forKey: "authentication_token")
        coder.encode(created_at, forKey: "created_at")
        coder.encode(updated_at, forKey: "updated_at")
        coder.encode(profile_picture, forKey: "profile_picture")
    }
}
