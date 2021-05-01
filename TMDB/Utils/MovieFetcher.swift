//
//  MovieFetcher.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import Foundation

class MovieFetcher {
    
    static func getMovies() -> Movies {
 
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                return movies
              } catch {
                //As the parsing is done using the local file, error is not handled here.
                print(error)
              }
        }
        return Movies(movies: [])
    }
}
