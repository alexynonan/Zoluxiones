//
//  MovieDetailViewController.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak private var lblTitulo : UILabel!
    @IBOutlet weak private var lblFecha : UILabel!
    @IBOutlet weak private var lblVotacion : UILabel!
    @IBOutlet weak private var lblResumen : UILabel!
    @IBOutlet weak private var imgMovie : UIImageView!
    @IBOutlet weak private var activityImage : UIActivityIndicatorView!

    var movieDetal : MovieDetailViewModel!
    var objMovieDetail : MovieBE!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieDetail()
    }
}

extension MovieDetailViewController {
    
    private func loadMovieDetail(){
        
        self.lblTitulo.text = self.objMovieDetail.title
        self.lblFecha.text = self.objMovieDetail.release_date?.convertDate(inDateWithFormat: "dd-MM-yyyy")
        self.lblVotacion.text = "\(self.objMovieDetail.vote_average ?? 0.0)"
        self.lblResumen.text = self.objMovieDetail.overview
        
        self.activityImage.startAnimating()
        self.imgMovie.downloadImageView(url: self.objMovieDetail.url_image) { image in
            self.activityImage.stopAnimating()
            self.imgMovie.image = image
        }
        
    }
}
