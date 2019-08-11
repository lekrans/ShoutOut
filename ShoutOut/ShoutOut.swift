//
//  ShoutOut.swift
//  ShoutOut
//
//  Created by Michael Lekrans on 2019-08-08.
//  Copyright © 2019 pluralsight. All rights reserved.
//

import Foundation
import CoreData

class ShoutOut: NSManagedObject {
    @NSManaged var from: String?
    @NSManaged var message: String?
    @NSManaged var sentDate: Date?
    @NSManaged var shoutCategory: String
    
    @NSManaged var toEmployee: Employee
    
    static var entityName: String { return "ShoutOut" }
}
