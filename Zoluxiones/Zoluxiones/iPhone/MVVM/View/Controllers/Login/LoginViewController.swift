//
//  LoginViewController.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak private var txtUser : UITextField!
    @IBOutlet weak private var txtPassword : UITextField!
    
    private var modelLogin : LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadLogin()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnLoginSession(_ sender : UIButton?){
        self.selectLogin()
    }

}

extension LoginViewController{
    
    private func loadLogin(){
        self.modelLogin = LoginViewModel()
//        self.txtUser.text = "Admin"
//        self.txtPassword.text = "Password*123"
    }
    
    private func selectLogin(){
        self.startLoader()
        self.modelLogin.sendLogin(user: self.txtUser.text, password: self.txtPassword.text) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.stopLoader()
                self.performSegue(withIdentifier: "MovieViewController", sender: nil)
            }
        } errorMessage: { message in
            self.stopLoader()
            let title = MessageAlert.General.titleButton
            let cancel = MessageAlert.General.agreeButton
            self.showAltert(withTitle: title, withMessage: message, withAcceptButton: cancel , withCompletion: nil)
        }
    }

    
}
