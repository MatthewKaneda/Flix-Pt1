//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Matthew Kaneda on 2/18/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var movie: [String: Any?]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        descLabel.text = movie["overview"] as? String
        
        if let imageUrlString = movie["poster_path"] as? String {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(imageUrlString)")
            posterView.af.setImage(withURL: imageUrl!)
        }
        
        if let backdropUrlString = movie["backdrop_path"] as? String {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w1280\(backdropUrlString)")
            backdropView.af.setImage(withURL: imageUrl!)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
