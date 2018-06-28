//
//  APIService.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 11/2/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import Foundation

class APIService {
    
    private init() {}
    static let sharedInstance = APIService()
    
    func getUserAPI(callBack: @escaping (User) -> Void, message: @escaping (String) -> Void) {
        
        APIManager.sharedInstance.POSTAPIWithResponseObject(
            route: Constant.RouteLogin,
            parameter: ["email":"m.lutfiazhar@gmail.com",
                        "password":"password",
                        "device_id":""],
            successBlock: { (responseObject: [String : Any]) in
                
                let user = User.init(data: responseObject)
                callBack(user)
                
        }) { (errorMessage: String) in
            
            message(errorMessage)
            
        }
        
    }
    
    func getProductsAPI(callBack: @escaping (Array<Product>) -> Void, message: @escaping (String) -> Void) {
        
        APIManager.sharedInstance.POSTAPIWithResponseObject(route: Constant.RouteProduct,
                                                            parameter: ["page":"0"],
                                                            successBlock: { (responseObject: [String : Any]) in
                                                                
                                                                let datas = responseObject["products"] as! Array<[String:Any]>
                                                                var array: Array<Product> = []
                                                                for data in datas {
                                                                    array.append(Product.init(data: data))
                                                                }
                                                                
                                                                callBack(array)
                                                                
        }) { (errorMessage: String) in
            message(errorMessage)
        }
        
    }
}
