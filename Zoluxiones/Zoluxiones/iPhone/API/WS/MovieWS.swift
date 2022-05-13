//
//  MovieWS.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import Alamofire

struct MovieWS {

    static var shared = MovieWS()
    
    func getMovie(_ page : Int,resultMoview successMovie : @escaping Closures.Movies,errorMoview errorMovie : @escaping Closures.FailureResponse){
        
        let url = WebServicesURL.Movie.getMovies + "\(page)&" + WebServicesURL.keyUser
        
        CSWebServices.shared.requestType(type: .get, url: url) { response, status in
            
            CSWebServices.shared.genericResponseData(response, statusCode: status, success: { json in
                
                if let result = json.dictionary?["results"]?.array,let page = json.dictionary?["page"]?.int{
                    
                    successMovie( result.map({ MovieBE($0) }), page)
                }else{
                    errorMovie(MessageAlert.General.messageArray, 0)
                }
                
            }, errorServices: errorMovie)
        }
    }
    
    func getMovieDetail(_ idMovie : Int,resultMoview successMovie : @escaping Closures.Movie,errorMoview errorMovie : @escaping Closures.FailureResponse){
        
        let url = WebServicesURL.Movie.getMovieDetail + "\(idMovie)?" + WebServicesURL.keyUser
        
        CSWebServices.shared.requestType(type: .get, url: url) { response, status in
            
            CSWebServices.shared.genericResponseData(response, statusCode: status, success: { json in
                
                successMovie( MovieBE(json) )
                
            }, errorServices: errorMovie)
        }
    }
}
