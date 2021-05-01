//
//  Movie.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import Foundation

struct Movies: Codable {
    var movies: [Movie]
}

struct Movie: Codable {
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieItem {
    var title = ""
    var overview = ""
    var imageUrl = ""
    
    init(movie: Movie) {
        title = movie.originalTitle
        overview = movie.overview
        
        imageUrl = Poster(path: movie.posterPath).url
    }
}
