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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadLogin()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func btnLoginSession(_ sender : UIButton?){
        self.performSegue(withIdentifier: "MovieViewController", sender: nil)
    }

}

extension LoginViewController{
    
    private func loadLogin(){
        self.txtUser.text = "Admin"
        self.txtPassword.text = "Password*123"
    }
    

    
}
