//
//  MovieListViewController.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import UIKit
import Combine

class MovieListViewController: UIViewController {
    
    private var movies: [MovieItem] = [] {
        didSet {
            moviesTableView.reloadData()
        }
    }
    
    private let vm: MovieListVM = MovieListVM()
    
    private var cancellable: AnyCancellable?
    
    //MARK:- Outlets
    @IBOutlet weak var moviesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = vm.$movies.sink(receiveValue: { movies in
            self.movies = movies
        })
    }
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailsViewController, let movie = sender as? MovieItem {
            destination.movie = movie
        }
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- TableView Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self), for: indexPath) as? MovieTableViewCell {
            
            cell.configure(with: movies[indexPath.row])
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    //MARK:- TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: String(describing: MovieDetailsViewController.self), sender: movies[indexPath.row])
    }
}


