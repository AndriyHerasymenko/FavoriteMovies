//
//  Movie+CoreDataProperties.swift
//  FavoriteMovies
//
//  Created by Andriy Herasymenko on 9/8/16.
//  Copyright © 2016 Andriy Herasymenko. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var genre: String?
    @NSManaged var url: String?
    @NSManaged var descript: String?
    @NSManaged var imbd: String?

}
