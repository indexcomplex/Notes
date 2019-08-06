//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Alan Hernandez on 8/2/19.
//  Copyright © 2019 alan Hernandez. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String

}
