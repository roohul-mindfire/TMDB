//
//  MovieListVM.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import Foundation


class MovieListVM: ObservableObject {
    
    @Published var movies: [MovieItem] = []
    
    init() {
        let movie = MovieFetcher.getMovies()
        movies = movie.movies.compactMap{MovieItem(movie: $0)}
    }
}
