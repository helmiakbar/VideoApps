//
//  Constant.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import UIKit

struct Constant {
    
    private struct Domains {
        static let Development = "http://128.199.91.243"
        static let Production = "http://api.clappingape.com"
    }
    
    private struct Routes {
        static let Product = "/api/v1/products/all_products_without_login"
        static let Login = "/api/v1/users/login_process"
    }
    
    struct Notification {
        static let googleSignIn = "googleSignInNotification"
    }
    
    static let LocaleIdentifier = "id_ID"
    
    static let BaseURL = Domains.Development
    static let RouteProduct = Routes.Product
    static let RouteLogin = Routes.Login
    
}
