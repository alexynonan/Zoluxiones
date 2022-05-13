//
//  ValidationNetwork.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import Alamofire

struct ValidationNetwork {
    
    static let sharedInstance = NetworkReachabilityManager()!
    
    static var isConnectedToInternet : Bool {
        self.sharedInstance.isReachable
    }    
    
}
