//
//  DataService.swift
//  ShoutOut
//
//  Created by Michael Lekrans on 2019-08-09.
//  Copyright © 2019 pluralsight. All rights reserved.
//

import Foundation
import CoreData

struct DataService: ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    
    func seedEmployees() {
        let employee1 = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: self.managedObjectContext) as! Employee
        employee1.firstName = "Jane"
        employee1.lastName = "Sherman"
        
        do {try self.managedObjectContext.save()} catch {
            print("Something went wrong: \(error)")
            self.managedObjectContext.rollback()
        }
    }
}
