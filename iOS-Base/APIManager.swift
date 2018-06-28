//
//  APIManager.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import UIKit
import Alamofire

class APIManager {
    
    private init() {}
    static let sharedInstance = APIManager()
    
    typealias SuccessHandlerObject = (_ responseObject: [String: Any]) -> Void
    typealias SuccessHandlerArray = (_ responseObject: Array<Any>) -> Void
    typealias FailHandler = (_ errorMessage: String) -> Void
    
    
    // MARK: - GET
    func GETAPIWithResponseObject(route: String, successBlock:@escaping SuccessHandlerObject, failureBlock:@escaping FailHandler){
        
        Alamofire.request(Constant.BaseURL+route).responseJSON { response in
            
            print("REQUEST.ROUTE: \(route)")
            
            switch response.result {
            case .success:
                let responseJSON = response.result.value as! [String:Any]
                
                print("RESPONSE.BODY: \(responseJSON)")
                
                if responseJSON["status"] != nil {
                    let status = responseJSON["status"] as! Bool
                    if status == false {
                        if responseJSON["message"] != nil {
                            failureBlock(responseJSON["message"] as! String)
                        }else{
                            failureBlock("Unknown Error")
                        }
                    }else{
                        successBlock(responseJSON)
                    }
                }else {
                    failureBlock("Error with undefined status")
                }
                break
                
            case .failure(let error):
                print("ERROR: \(error)")
                failureBlock((response.error?.localizedDescription)!)
                break
            }
        }
    }
    
    func GETAPIWithResponseArray(route: String, successBlock:@escaping SuccessHandlerArray, failureBlock:@escaping FailHandler){
        
        Alamofire.request(Constant.BaseURL+route).responseJSON { response in
            
            print("REQUEST.ROUTE: \(route)")
            
            switch response.result {
            case .success:
                if ((response.result.value as? Array<Any>) != nil) {
                    let responseJSON = response.result.value as! Array<Any>
                    
                    print("RESPONSE.BODY: \(responseJSON)")
                    
                    successBlock(responseJSON)
                }else{
                    failureBlock("Error, Response is an Object")
                }
                
                break
                
            case .failure(let error):
                print("ERROR: \(error)")
                failureBlock((response.error?.localizedDescription)!)
                break
            }
        }
    }
    
    
    
    // MARK: - POST
//    func POSTAPIWithResponseObject(route: String, parameter: [String: Any], successBlock:@escaping SuccessHandlerObject, failureBlock:@escaping FailHandler){
//        
//        Alamofire.request(Constant.BaseURL+route, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
//            
//            print("REQUEST.ROUTE: \(route)")
//            print("REQUEST.BODY: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))")
//            
//            switch response.result {
//            case .success:
//                let responseJSON = response.result.value as! [String:Any]
//                
//                print("RESPONSE.BODY: \(responseJSON)")
//                
//                if responseJSON["status"] != nil {
//                    let status = responseJSON["status"] as! Bool
//                    if status == false {
//                        if responseJSON["message"] != nil {
//                            failureBlock(responseJSON["message"] as! String)
//                        }else{
//                            failureBlock("Unknown Error")
//                        }
//                    }else{
//                        successBlock(responseJSON)
//                    }
//                }else {
//                    failureBlock("Error with undefined status")
//                }
//                break
//                
//            case .failure(let error):
//                print("ERROR: \(error)")
//                failureBlock((response.error?.localizedDescription)!)
//                break
//            }
//        }
//    }
    
    func POSTAPIWithResponseObject(route: String, parameter: [String: Any], successBlock:@escaping SuccessHandlerObject, failureBlock:@escaping FailHandler){
        
        Alamofire.request(Constant.BaseURL+route, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            
            print("REQUEST.ROUTE: \(route)")
            print("REQUEST.BODY: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))")
            
            switch response.result {
            case .success:
                let responseJSON = response.result.value as! [String:Any]
                
                print("RESPONSE.BODY: \(responseJSON)")
                
                if responseJSON["err"] != nil {
                    let status = responseJSON["err"] as! Int
                    if status == 1 {
                        if responseJSON["err_msg"] != nil {
                            failureBlock(responseJSON["err_msg"] as! String)
                        }else{
                            failureBlock("Unknown Error")
                        }
                    }else{
                        successBlock(responseJSON)
                    }
                }else {
                    successBlock(responseJSON)
                }
                break
                
            case .failure(let error):
                print("ERROR: \(error)")
                failureBlock((response.error?.localizedDescription)!)
                break
            }
        }
    }
    
    func POSTAPIWithResponseArray(route: String, parameter: [String: Any], successBlock:@escaping SuccessHandlerArray, failureBlock:@escaping FailHandler){
        
        Alamofire.request(Constant.BaseURL+route, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            
            print("REQUEST.ROUTE: \(route)")
            print("REQUEST.BODY: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))")
            
            switch response.result {
            case .success:
                if ((response.result.value as? Array<Any>) != nil) {
                    let responseJSON = response.result.value as! Array<Any>
                    print("RESPONSE.BODY: \(responseJSON)")
                    successBlock(responseJSON)
                }else{
                    failureBlock("Error, Response is an Object")
                }
                
                break
                
            case .failure(let error):
                print("ERROR: \(error)")
                failureBlock((response.error?.localizedDescription)!)
                break
            }
        }
    }
}
