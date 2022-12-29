//
//  PersistenceManager.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//

import Foundation
import UIKit
import CoreData

class PersistenceManager{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK: - Data Manipulation Methods
    
    func saveStudentIntro(){
        do{
            try context.save()
        }catch{
            print("Error saving context \(error)")
        }
    }
    
    func  loadStudentIntro(with request: NSFetchRequest<StudentIntro> = StudentIntro.fetchRequest()) -> [StudentIntro]{
        var loadedArr = [StudentIntro]()
        do{
            loadedArr = try context.fetch(request)
        }catch{
            print("Error loading data from context \(error)")
        }
        
        return loadedArr
    }

}
