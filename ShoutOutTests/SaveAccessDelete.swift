//
//  SaveAccessDelete.swift
//  ShoutOutTests
//
//  Created by Michael Lekrans on 2019-08-10.
//  Copyright © 2019 pluralsight. All rights reserved.
//

import XCTest
import CoreData

@testable import ShoutOut

class SaveAccessDelete: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchAllEmployees() {
        let managedObjectContext = createMainContextInMemory()
        let dataService = DataService(managedObjectContext: managedObjectContext)
        dataService.seedEmployees()
        
        let employeeFetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        do {
            let employee = try managedObjectContext.fetch(employeeFetchRequest)
            print(employee)
        } catch {print("Something went wrong : \(error)")}
    }

}
