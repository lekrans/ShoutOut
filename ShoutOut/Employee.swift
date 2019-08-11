//
//  Employee.swift
//  ShoutOut
//
//  Created by Michael Lekrans on 2019-08-08.
//  Copyright © 2019 pluralsight. All rights reserved.
//

import Foundation
import CoreData

class Employee: NSManagedObject {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    
    @NSManaged var shoutOuts: NSSet? // Not an array..
    
    static var entityName: String { return "Employee"}
}
