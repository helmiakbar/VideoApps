//
//  UtilityManager.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import Foundation
import UIKit

class UtilityManager {
    
    private init() {}
    static let sharedInstance = UtilityManager()
    
    // MARK: - Utils
    func checkBoolValueFromString(string: String) -> Bool {
        switch string {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return false
        }
    }
    
    func getPriceWithCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: Constant.LocaleIdentifier)
        let result = "\(formatter.currencyCode as String) \(formatter.string(from: value as NSNumber)! as String)"
        return result;
    }
    
    
    // MARK: - Colors
    func getBaseAppColor() -> UIColor {
        return UIColor.init(red: 234.0/255.0, green: 47.0/255.0, blue: 12.0/255.0, alpha: 1.0)
    }
    
    
    // MARK: - Device Identifier Keychain Method
    func deviceIdentifier() -> String {
        var deviceId: String! = self.requestDeviceIdentifierFromKeychain()
        print("DEVICE ID FROM KEYCHAIN: \(deviceId)")
        
        if deviceId == "" {
            deviceId = self.createRandomIdentifier()
            self.saveDeviceIdentifierFromKeychain(deviceIdentifier: deviceId)
        }
        
        return deviceId
    }
    
    func createRandomIdentifier() -> String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }
    
    func requestDeviceIdentifierFromKeychain() -> String {
        let dictionary : [String: Any] = [kSecClass as String : kSecClassGenericPassword,
                                          kSecAttrService as String : "trigo",
                                          kSecAttrAccount as String : "trigo",
                                          kSecReturnData as String : kCFBooleanTrue,
                                          kSecMatchLimit as String : kSecMatchLimitOne]
        
        var result : AnyObject?
        let err: OSStatus = SecItemCopyMatching(dictionary as CFDictionary, &result)
        if (err == errSecSuccess) {
            // on success cast the result to a dictionary and extract the
            // username and password from the dictionary.
            if let retrievedData = result as? NSData {
                return NSString(data: retrievedData as Data, encoding: String.Encoding.utf8.rawValue) as! String
            }
        } else {
            // probably a program error,
            // print and lookup err code (e.g., -50 = bad parameter)
            
            return ""
        }
        
        return ""
    }
    
    func saveDeviceIdentifierFromKeychain(deviceIdentifier: String) {
        let data: Data = deviceIdentifier.data(using: String.Encoding.utf8)!
        let dictionary : [String: Any] = [kSecClass as String : kSecClassGenericPassword,
                                          kSecAttrService as String : "trigo",
                                          kSecAttrAccount as String : "trigo",
                                          kSecValueData as String : data]
        
        SecItemAdd(dictionary as CFDictionary, nil)
    }
}
