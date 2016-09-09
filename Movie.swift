//
//  Movie.swift
//  FavoriteMovies
//
//  Created by Andriy Herasymenko on 9/8/16.
//  Copyright © 2016 Andriy Herasymenko. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {
    
    
    func setMovieImage(img: UIImage) {
        
        let data = UIImagePNGRepresentation(img)
        self.image = data
        
    }
    
    func getMovieImg() -> UIImage {
        
        let img = UIImage(data: self.image!)!
        return img
    }
    
}
