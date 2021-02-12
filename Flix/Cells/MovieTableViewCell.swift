//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Matthew Kaneda on 2/10/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {


    @IBOutlet weak var MovieDescriptionLabel: UILabel!
    @IBOutlet weak var MovieTitleLabel: UILabel!
    @IBOutlet weak var MovieImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
