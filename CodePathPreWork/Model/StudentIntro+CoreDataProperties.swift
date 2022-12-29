//
//  StudentIntro+CoreDataProperties.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/21/22.
//
//

import Foundation
import CoreData


extension StudentIntro {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentIntro> {
        return NSFetchRequest<StudentIntro>(entityName: "StudentIntro")
    }

    @NSManaged public var name: String?
    @NSManaged public var introduction: String?

}

extension StudentIntro : Identifiable {

}
