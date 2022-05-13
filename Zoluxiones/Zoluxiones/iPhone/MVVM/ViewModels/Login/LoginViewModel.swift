//
//  LoginViewModel.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class LoginViewModel: NSObject {

    private var loginBL : LoginBL!
    
    override init() {
        super.init()
        self.loginBL = LoginBL()        
    }
    
    func sendLogin(user : String?,password : String?, completion : @escaping Closures.Success, errorMessage : @escaping Closures.Message){
        
        self.loginBL.loginSession(user: user ?? "", password: password ?? "", resultLogin: {
            completion()
        }, errorLogin: errorMessage)
    }
    
    
}
