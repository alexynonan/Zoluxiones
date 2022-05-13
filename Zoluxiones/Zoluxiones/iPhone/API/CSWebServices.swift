//
//  CSWebServices.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class CSWebServices {
    
    static var shared = CSWebServices()
    
    func requestType(type serviceType : HTTPMethod,url : String,params : Parameters? = nil ,header : HTTPHeaders? = nil,successResponse : @escaping Closures.SuccessResponse){
        
        let request = AF.request(url, method: serviceType,parameters: params, headers: header)
        request.response { response in
            print("\n\n**********************************************************************")
            print("SERVICIO \(serviceType.rawValue): \(url)")
            print(JSON(response.data ?? MessageAlert.General.errorServiceNotFount))
            successResponse(JSON(response.data ?? ""), response.response?.statusCode ?? 0)
            print("**********************************************************************\n\n")
        }
    }
    
//    MARK: - VALIDATION RESPONSE DATA DEFAULTS
    func genericResponseData(_ response: JSON,statusCode: Int ,success: (_ json: JSON) -> Void,errorServices error: @escaping Closures.FailureResponse){
        
        if let status = response.dictionary?["status_code"], status == 7 || status == "7"{
            error(self.manageErrorFromResponse(response), statusCode)
        }else if let expire = response.dictionary?["status_code"], expire == 34 || expire == "34"{
            error(self.manageErrorFromResponse(response), statusCode)
        }else{
            success(response)
        }
    }
    
//    MARK: - Validation Responde Message
    private func manageErrorFromResponse(_ response: JSON? = nil) -> String{
        
        if let message = response?.dictionary?["status_message"]{
            return message.stringValue
        }else{
            return MessageAlert.General.errorServiceNotFount
        }
    }


}
