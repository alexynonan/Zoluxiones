//
//  WebServicesURL.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import Foundation

struct WebServicesURL {
    
    static private let baseURLServices = "https://api.themoviedb.org/3/movie/"
    
    static let keyUser = "api_key=d9b14c5d6e1b20f8566edf44c9344518"
    static let domainImage = "https://image.tmdb.org/t/p/w500/"
    
    struct Movie {
        static let getMovies        = baseURLServices + "upcoming?page="
        static let getMovieDetail   = baseURLServices
    }
    
}
