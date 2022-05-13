//
//  Closures.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import SwiftyJSON

struct Closures {

    //MARK: General
    typealias Message                   = (_ message        : String)           -> Void
    typealias Success                   = () -> Void
    typealias Image                     = (_ image          : UIImage)   -> Void
    
    //MARK: WebServices
    typealias SuccessResponse           = (_ response       : JSON,_ status : Int) -> Void
    typealias FailureResponse           = (_ errorMessage   : String,_ status : Int) -> Void
    

}
