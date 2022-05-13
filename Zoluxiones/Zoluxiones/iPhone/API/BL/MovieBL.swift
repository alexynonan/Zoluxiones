//
//  MovieBL.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import Alamofire

struct MovieBL {
    
    func getMovie(_ page : Int,listActual : [MovieBE],resultMoview successMovie : @escaping Closures.Movies,errorMoview errorMovie : @escaping Closures.FailureResponse){

        MovieWS.shared.getMovie(page) { arrayMovie, page in
                            
            let dataBD = CDMovie.listMovie()
            CDMovie.deleteMovie(conObject: dataBD)
            
            if listActual.count == 0{
                
                for item in arrayMovie{
                    CDMovie.saveMovie(item)
                }
                
            }else{
                for item in listActual{
                    CDMovie.saveMovie(item)
                }
                
                for item in arrayMovie{
                    CDMovie.saveMovie(item)
                }
            }
            
            successMovie(arrayMovie, page)
            
        } errorMoview: { errorMessage, status in
            
            if !ValidationNetwork.isConnectedToInternet{
                
                let dataBD = CDMovie.listMovie()
                
                var arrayLocal = [MovieBE]()
                
                for item in dataBD{
                    var obj = MovieBE()
                    obj.title = item.title
                    obj.poster_path = item.poster_path
                    obj.vote_average = item.vote_average
                    obj.overview = item.overview
                    obj.release_date = item.release_date
                    arrayLocal.append(obj)
                }
                
                successMovie(arrayLocal,0)
            }else{
                errorMovie(errorMessage,status)
            }
        }
        
    }
 
    func getMovieDetail(_ idMovie : Int,resultMoview successMovie : @escaping Closures.Movie,errorMoview errorMovie : @escaping Closures.FailureResponse){
        MovieWS.shared.getMovieDetail(idMovie, resultMoview: successMovie, errorMoview: errorMovie)
    }
}
