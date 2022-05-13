//
//  CDMovie.swift
//  Zoluxiones
//
//  Created by Alexander Ynoñan H. on 13/05/22.
//

import UIKit
import CoreData

class CDMovie: NSObject {

    class func saveMovie(_ movie : MovieBE) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let contexto = appDelegate.persistentContainer.viewContext
   
        let objBD = NSEntityDescription.insertNewObject(forEntityName: "MovieBD", into: contexto) as! MovieBD
        
        objBD.poster_path = movie.poster_path
        objBD.title = movie.title
        objBD.vote_average = Double(movie.vote_average ?? 0.0)
        objBD.release_date = movie.release_date ?? Date()
        objBD.overview = movie.overview
        
        appDelegate.saveContext()
    }
        
    class func deleteMovie(conObject : [MovieBD]){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieBD")
        fetchRequest.includesPropertyValues = false
        
        let appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context : NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        do{
            for item in conObject{
                context.delete(item)
            }
            try context.save()
        }catch{
            print("Error")
        }
    }
    
    class func listMovie() -> [MovieBD]{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        let fetch : NSFetchRequest<MovieBD> = Movie.fetchRequest()
        
        let sortName = NSSortDescriptor(key: "vote_average", ascending: true)
        
        fetch.sortDescriptors = [sortName]
        
        do {
           let result = try contexto.fetch(fetch)
            return result
        } catch  {
            return []
        }
    }
    
}
