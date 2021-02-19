//
//  GridViewController.swift
//  Flix
//
//  Created by Matthew Kaneda on 2/18/21.
//

import UIKit
import AlamofireImage

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesArray = [[String: Any?]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 2
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        

        // Do any additional setup after loading the view.
        
        getAPIData()
    }
    
    func getAPIData() {
        API.getMovieGrid() {
            (movies) in
            guard let movies = movies else {
                return
            }
            print(movies)
            self.moviesArray = movies
            self.collectionView.reloadData()
            print(self.moviesArray)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridViewCell", for: indexPath) as! GridViewCell
        
        let movie = moviesArray[indexPath.item]
        
        if let imageUrlString = movie["poster_path"] as? String {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(imageUrlString)")
            cell.posterView.af.setImage(withURL: imageUrl!)
        }
        
        return cell
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
