//
//  LoginBL.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

struct LoginBL {

    func loginSession(user : String,password : String,resultLogin successLogin : @escaping Closures.Success,errorLogin errorMessage : @escaping Closures.Message){
        
        if user.count == 0{
            errorMessage(MessageAlert.Login.errorUser)
            return
        }
        
        if password.count == 0{
            errorMessage(MessageAlert.Login.errorPassword)
            return
        }
        
        if user == "Admin" && password == "Password*123" {
            successLogin()
        }else{
            errorMessage(MessageAlert.Login.errorUserPassword)            
        }
    }
}
