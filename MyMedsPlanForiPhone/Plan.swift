//
//  Plan.swift
//  
//
//  Created by Felix Olivares on 8/6/15.
//
//

import Foundation
import CoreData

@objc(Plan)
class Plan: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    @NSManaged var medicineName: String?
    @NSManaged var medicineKind: String?
    @NSManaged var additionalInfo: String?
    @NSManaged var otherUser: String?
    @NSManaged var periodicity: NSNumber?
    @NSManaged var unitsPerDose: NSNumber?
    
}
