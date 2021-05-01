//
//  MovieTableViewCell.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets

    @IBOutlet weak var movieImageView: RemoteImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //MARK:- View configuration
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with movie: MovieItem) {
        movieImageView.setImage(urlString: movie.imageUrl, placeholder: UIImage(named: "MoviePlaceholder"))
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }

}
