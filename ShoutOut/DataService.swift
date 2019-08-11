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
//        let names = [["Jane", "Sherman"],
//                     ["Luke", "Jones"]]
//
//
//        for name in names {
//            var newEmployee = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
//            newEmployee.firstName = name[0]
//            newEmployee.lastName = name[1]
//            print(newEmployee)
//
//        }
        
        let employee1 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee1.firstName = "Jane"
        employee1.lastName = "Sherman"

        let employee2 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee2.firstName = "Luke"
        employee2.lastName = "Jones"

        let employee3 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee3.firstName = "Kathy"
        employee3.lastName = "Smith"

        let employee4 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee4.firstName = "Jerome"
        employee4.lastName = "Rodriguez"


        let employee5 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee5.firstName = "Maria"
        employee5.lastName = "Tillman"

        let employee6 = NSEntityDescription.insertNewObject(forEntityName: Employee.entityName, into: self.managedObjectContext) as! Employee
        employee6.firstName = "Paul"
        employee6.lastName = "O'Brian"
        
        do {try self.managedObjectContext.save()} catch {
            print("Something went wrong: \(error)")
            self.managedObjectContext.rollback()
        }
    }
}
