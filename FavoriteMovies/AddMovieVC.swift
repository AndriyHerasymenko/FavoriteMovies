//
//  AddMovieVC.swift
//  FavoriteMovies
//
//  Created by Andriy Herasymenko on 9/7/16.
//  Copyright © 2016 Andriy Herasymenko. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var descrField: UITextField!
    @IBOutlet weak var IMBDField: UITextField!
    @IBOutlet weak var URLField: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 7.0
        movieImg.clipsToBounds = true

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    

    @IBAction func addMovieBtn(sender: AnyObject) {
        
        if let title = titleField.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = title
            movie.genre = genreField.text
            movie.descript = descrField.text
            movie.url = URLField.text
            movie.imbd = IMBDField.text
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }

            self.navigationController?.popViewControllerAnimated(true)
        }
    
    }


}
