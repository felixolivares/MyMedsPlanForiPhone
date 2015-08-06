//
//  Plan+CoreDataProperties.swift
//  
//
//  Created by Felix Olivares on 8/6/15.
//
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Plan {

    @NSManaged var medicineName: String?
    @NSManaged var medicineKind: String?
    @NSManaged var additionalInfo: String?
    @NSManaged var otherUser: String?
    @NSManaged var periodicity: NSNumber?
    @NSManaged var unitsPerDose: NSNumber?

}
