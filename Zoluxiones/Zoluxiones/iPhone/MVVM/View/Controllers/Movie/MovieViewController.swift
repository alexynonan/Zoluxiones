//
//  MovieViewController.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var clvMovie : UICollectionView!
    
    private var modelMovie : MovieViewModel!
    private var dataSourceMovie : MoviewCollectionViewDataSource!
    
    private var sessionURL : URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUI()
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - Methods
extension MovieViewController {
    
    @objc private func loadUI(){
        self.modelMovie = MovieViewModel()
        self.modelMovie.loadMovieModel(nextPage: false)
        self.movieCollectionReload()
    }
    
    private func movieCollectionReload(){
        
        self.modelMovie.completionMovieController = {
            self.stopLoader()
            self.updateDataSource()
        }
        
        self.modelMovie.errorMovieController = { errorMessage in
            self.showAltert(withTitle: "UPS!", withMessage: errorMessage, withAcceptButton: "Entiendo") {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func updateDataSource(){
                
        let identifier = "MovieCollectionViewCell"
        let arrayMovie = self.modelMovie.arrayMovies ?? []
        
        self.dataSourceMovie = MoviewCollectionViewDataSource(cellIdentifier: identifier , items: arrayMovie , configureCell: { cell, index in
            
        })
        
        DispatchQueue.main.async {
            self.clvMovie.dataSource = self.dataSourceMovie
            self.clvMovie.delegate = self.dataSourceMovie
            self.clvMovie.performBatchUpdates {
                self.clvMovie.reloadData()
            }
        }
        
        self.dataSourceMovie.scrollBottom = {
            if !self.modelMovie.statePage{
                self.startLoader()
                self.modelMovie.loadMovieModel(nextPage: true)
            }
        }
    }
}
