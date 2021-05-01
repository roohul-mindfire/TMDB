//
//  APIhandler.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import Foundation


let baseURL = "https://image.tmdb.org/t/p/w92"

struct Poster {
    var path = ""
    
    var url: String {
        return baseURL + path
    }
}

class APIhandler {
    
}
