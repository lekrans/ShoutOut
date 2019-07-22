#  CORE DATA

## Core Data Stack
* Model
* Represent
* Manipulate
* Persist


Three categories that includes the 5 objects (moving parts) that is needed

* Model
    * NSManagedObjectModel  // the model
* Manage
    * NSMangedObject  // The objects in the model .. like ShoutOut, Employee and so on
    * NSManagedObjectContext // Gives us a way to modify/manipulate the NSManagedObjects, The end output of the Core Data Stack is a NSManagedObjectContext Instance
        * Create
        * Change
        * Track Changes
        * Delete
        * Query
        * Save
* Persist
    * NSPersistentStoreCoordinator // Takes care of communication between your NSManagedObjectContext and the store (NSPersistentStore)
    * NSPersistentStore // The DataStore.. sqllite, memory and so on 
    
    ## Setting it up
    Step1   Create a NSManagedObjectModel
    Step2   Create the NSPersistentStore and the NSPersistenStoreCoordinator
    Step3   Create the NSManagedObjectContext
    
    
    ### Setup
        1.  Select the "Model" folder and create a new file (new file/Core Data/Data Model) and name it ShoutOut (this creates a "ShoutOut.xcdatamodeld" file)
        2.  Select the root (ShoutOut) folder and create a new swift file and name it CoreDataStack.swift
        3. In the CoreDataStack.swift file, Import CoreData and write a new function "createMainContext() -> NSManagedObjectContext"
        4. In this file we goes through the three steps mentioned above
        
        

