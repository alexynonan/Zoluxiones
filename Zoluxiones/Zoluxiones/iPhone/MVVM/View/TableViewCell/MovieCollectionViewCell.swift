//
//  MovieCollectionViewCell.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak private var lblTitulo : UILabel!
    @IBOutlet weak private var imgMovie : UIImageView!
    @IBOutlet weak private var activityMovie : UIActivityIndicatorView!
    
    var objBE : MovieBE!{
        didSet{
            self.lblTitulo.text = self.objBE.title
            self.activityMovie.startAnimating()            
            self.imgMovie.downloadImageView(url: self.objBE.url_image) { image in
                self.activityMovie.stopAnimating()
                self.imgMovie.image = image
            }
            
            self.layer.cornerRadius = 5
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
}
