//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Andriy Herasymenko on 9/7/16.
//  Copyright © 2016 Andriy Herasymenko. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let contex = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let result = try contex.executeFetchRequest(fetchRequest)
            self.movies = result as! [Movie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
/*
 
 Model:
title, a description, the IMDB url, the IMDB plot description, and an image 
 
 Class MovieManager:
 1. movies +
 2. add movie +
 3. del movie
 4. add to favorites

 ViewController:
 1. favoritesMoviesVC
 2. AddMovieVC
 3. DetailVC
 
 
 */
 