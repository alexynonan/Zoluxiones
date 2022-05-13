//
//  MovieBE.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import SwiftyJSON

struct MovieBE {
    
    var poster_path : String?
    var title : String?
    var vote_average : Double?
    var release_date : Date?
    var overview : String?
    
    init(_ json : JSON? = nil) {
        self.poster_path = json?.dictionary?["poster_path"]?.string ?? ""
        self.title = json?.dictionary?["title"]?.string ?? ""
        self.vote_average = json?.dictionary?["vote_average"]?.double ?? 0.0
        self.release_date = .convertDateText(json?.dictionary?["release_date"]?.string ?? "", inDateWithFormat: "yyyy-MM-dd")
        self.overview = json?.dictionary?["overview"]?.string ?? ""
    }
    
    var url_image : String{        
        return "\(WebServicesURL.domainImage)\(self.poster_path ?? "")"
    }
}
