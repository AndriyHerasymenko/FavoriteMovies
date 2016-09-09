//
//  MovieCell.swift
//  FavoriteMovies
//
//  Created by Andriy Herasymenko on 9/7/16.
//  Copyright © 2016 Andriy Herasymenko. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = movieImg.frame.size.width / 2.5
        movieImg.clipsToBounds = true

    }
    
    func configureCell(movie: Movie) {
        titleLbl.text = movie.title
        genreLbl.text = movie.genre
        movieImg.image = movie.getMovieImg()
        
    }



}
