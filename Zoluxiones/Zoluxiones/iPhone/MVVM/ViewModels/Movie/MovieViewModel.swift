//
//  MovieViewModel.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit

class MovieViewModel : NSObject {
    
    private var movieBL : MovieBL!
    var arrayMovies : [MovieBE]!
    var page : Int!
    var statePage : Bool!
    
    var completionMovieController : Closures.Success = {}
    var errorMovieController : Closures.Message = { message in }
    
    override init() {
        super.init()
        self.movieBL =  MovieBL()
        self.page = 1
        self.statePage = false
        self.arrayMovies = []
    }
    
    func loadMovieModel(nextPage : Bool) {
        
        if nextPage {
            self.statePage = nextPage
            self.page += 1
        }
        
        self.movieBL.getMovie(self.page, listActual: self.arrayMovies) { resultMovie, resultPage in
            
            if self.page == resultPage{
                
                if resultMovie.count == 0 {
                    self.page -= 1
                }
                    
                for i in resultMovie {
                    self.arrayMovies.append(i)
                }
                
                self.statePage = false
                self.completionMovieController()
            
            }else{
                
                if resultPage == 0 {
                    self.page -= 1
                }
                
                let paginationActul = resultMovie.count / 20
                self.page = paginationActul
                
                self.arrayMovies = resultMovie
                self.statePage = false
                self.completionMovieController()
            }
            
        } errorMoview: { errorMessage, status in
            self.errorMovieController(errorMessage)
        }
    }

}

