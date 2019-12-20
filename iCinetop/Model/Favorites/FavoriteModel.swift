//
//  FavoriteModel.swift
//  iCinetop
//
//  Created by Alcides Junior on 19/12/19.
//  Copyright © 2019 Alcides Junior. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class FavoriteModel{
    let id: Int
    let genres,originalTitle,posterPath,releaseDate: String
    var data: [NSManagedObject] = []
    
    init(id: Int, genres: String, originalTitle: String, posterPath: String, releaseDate: String){
        self.id = id
        self.genres = genres
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.releaseDate = releaseDate
    }
    
    func create(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managerContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managerContext) else{return}
        
        let favMovie = NSManagedObject(entity: entity, insertInto: managerContext)
        favMovie.setValue(self.id, forKey: "id")
        favMovie.setValue(self.genres, forKey: "genres")
        favMovie.setValue(self.originalTitle, forKey: "originalTitle")
        favMovie.setValue(self.posterPath, forKey: "posterPath")
        favMovie.setValue(self.releaseDate, forKey: "releaseDate")
        
        do{
            try managerContext.save()
        }catch let error as NSError{
            print("Could not save \(error) \(error.userInfo)")
        }
    }
    
    func getAll(completion: @escaping (Result<[NSManagedObject],Error>)->Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        
        do{
            let results = try managerContext.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                self.data.append(result)
            }
            completion(self.data)
        }catch let error as NSError{
            print("Could not save \(error) \(error.userInfo)")
            completion(error as Error as! Result<[NSManagedObject], Error>)
        }
    }
}
