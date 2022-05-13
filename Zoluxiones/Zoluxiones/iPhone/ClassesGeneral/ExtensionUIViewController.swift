//
//  ExtensionUIViewController.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController : NVActivityIndicatorViewable {
    
    func showAltert(withTitle title: String, withMessage message : String, withAcceptButton accept: String, withCompletion completion : (() -> Void)?){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: accept, style: UIAlertAction.Style.cancel) { (action : UIAlertAction) in
            DispatchQueue.main.async{
                completion?()
            }
        }
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func startLoader(withMessage message: String? = nil,size : CGFloat = 10) {
        
        let font = UIFont(name: "Helvetica Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        let tamanio = CGSize(width: 50, height: 50)
        self.startAnimating(tamanio, message: message, messageFont: font, type: .ballPulse, color: .white, minimumDisplayTime: 5)
    }
    
    func stopLoader() {
        stopAnimating()
    }
    
    @IBAction func btnExitGeneral(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
