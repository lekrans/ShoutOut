//
//  CoreDataStack.swift
//  ShoutOut
//
//  Created by Michael Lekrans on 2019-07-21.
//  Copyright © 2019 pluralsight. All rights reserved.
//

import Foundation
import CoreData

func createMainContext() -> NSManagedObjectContext {
    // Initialize NSManagedObjectModel
    let modelURL = Bundle.main.url(forResource: "ShoutOut", withExtension: "momd")
    guard let model = NSManagedObjectModel(contentsOf: modelURL!) else {
        fatalError("model not exists!")
    }
    // Configure NSPersistenStore
    let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
    
    let storeURL = URL.documentsURL.appendingPathComponent("ShoutOut.sqlite")
    
    // TODO: Remove the removeItem.. this is temporary .. should use migration instead
    try! FileManager.default.removeItem(at: storeURL)
    
    try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
    
    //' Create and return NSManagedObjectContext
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = psc
    
    return context
}

extension URL {
    static var documentsURL: URL {
        return try! FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
}

protocol ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext! { get set}
}
