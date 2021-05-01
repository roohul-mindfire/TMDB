//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
   
    //MARK:- IBOutlets
    @IBOutlet weak var movieImageView: RemoteImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: MovieItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        setValues()
    }
    
    private func setValues() {
        titleLabel.text = ""
        overviewLabel.text = ""
        movieImageView.image = #imageLiteral(resourceName: "MoviePlaceholder")
        
        guard let movie = movie else {return}
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        movieImageView.setImage(urlString: movie.imageUrl, placeholder: #imageLiteral(resourceName: "MoviePlaceholder"))
    }

}
