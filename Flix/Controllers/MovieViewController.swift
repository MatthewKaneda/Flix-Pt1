//
//  ViewController.swift
//  Flix
//
//  Created by Matthew Kaneda on 2/10/21.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray = [[String: Any?]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getAPIData()
    }
    
    func getAPIData() {
        API.getMovies() {
            (movies) in
            guard let movies = movies else {
                return
            }
            print(movies)
            self.moviesArray = movies
            self.tableView.reloadData()
            print(self.moviesArray)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        
        let movie = moviesArray[indexPath.row]
        print("movie", movie)
        
        // Label to restaurant name for each cell
        cell.MovieTitleLabel.text = movie["title"] as? String ?? ""
        
        cell.MovieDescriptionLabel.text = movie["overview"] as? String ?? ""
        
        
        // image of movie
        if let imageUrlString = movie["poster_path"] as? String {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(imageUrlString)")
            cell.MovieImageView.af.setImage(withURL: imageUrl!)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = moviesArray[indexPath.row]
        
        let detailsViewController = segue.destination as! MovieDetailsViewController
        
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


}

