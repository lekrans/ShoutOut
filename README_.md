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
    
    ## 1) Setting it up
    *This is done in our CoreDataStack.swift file*
    Step1   Create a NSManagedObjectModel
    Step2   Create the NSPersistentStore and the NSPersistenStoreCoordinator
    Step3   Create the NSManagedObjectContext
    
    
    ### 2) Setup
        1.  Select the "Model" folder and create a new file (new file/Core Data/Data Model) and name it ShoutOut (this creates a "ShoutOut.xcdatamodeld" file)
        2.  Select the root (ShoutOut) folder and create a new swift file and name it CoreDataStack.swift
        3. In the CoreDataStack.swift file, Import CoreData and write a new function "createMainContext() -> NSManagedObjectContext"
        4. In this file we goes through the three steps mentioned above
        
        
        
    ### 3) Use Dependency Injection to set the NSManagedObjectContext to the first view 
    We do this to be able to switch the NSManagedObjectContext from Sqllite to InMemoryStore for testing
    
    * we do that by creating a function "createManagedContext( ) -> NSManagedObjectContext" in the CoreDataStack.swift file
    * from AppDeleage.swift in the application - didFinishWithOptions function we get the managedContext and assign it to the 'first' view - aka ShoutOutDraftsViewController
    
    
    ### 4) Passing the ManagedObjectContext to the other views
    Override the prepare(forSeque) method to pass it on to the next view.. see the ShoutOutDraftsViewController.Swift
    To make it more clear what we are doing.. we create a protocol "ManagedObjectContextDependentType" so we can easily see what viewControllers that implement (are dependent) on it
    We add this to the remaining viewControllers (like interface) and create the calls by overrideing the prepare(forSegue)
    
    ### 5) UnitTest
    // Note that these tests are visible under the diamond shape with a minus in it in the navigator, right click to run
    The testfiles were already included so I need to look into testing more
    
    * We create a unit test by adding to the ShoutOutTests/ShoutOutTest.swift file .. we 
        * copy the createManagedContext from the CoreDataStack.swift file
        * add it to the testfile
        * rename it to "createManagedContextInMemory"
        * create a func in the test named "testManagedObjectContext" and set the view's managedObjectContent to the result from "createManagedContextInMemory"
        * add an assertion for the test
        
        
    
    ## CREATE THE DATA MODEL AND NSManagedObject subclass
    
    ### Entity, Attribute and Relationshops
    *   Entity is like a class
    *   Attribute is like the property on a class
    *   Relationship connects Entities
    
    We represent an Entity in code as an NSManagedObject subclass
    
    ### Create the datamodel (described in 5) )
    
    ### Create the NSManagedObject subclasses
    THREE ways.. 
    * automatically:  (xcode automatically creates them), 
    * explicit: select the model file and choose Editor/"Create managed object subclass.." wizard
    * manually: To have more control when you add things. The first course choose this option
    
    ### Create subclasses manually
    * select the model folder
    * add new file / swift file .. in this project it will be named "ShoutOut.swift"
    * Stop XCode from generate automatically 
        * Select the model
        * For each attribute
            * In the class section (right side) change the Module -> Currernt Product Module and Codegen -> Manual/None
            * Might have to clean the build folder (menu: Project/Clean build folder
            
    * Create the class and the rest of the code (see the Model/ShoutOut.swift file)
    
    ### Create the relationships
    * We create a new Entity (select the model file and add new Entity in the editor)
    * Add the attributes (in this case firstName and lastName)
    * Add relationships between the Employee and ShoutOut by pressing + in the editor under relationships and then fill in the right attributes (if optional, deleteRule, toOne or toMany and so on)
    * Create a new file in the model folder 'Employee.swift' and add the class and attributes and the relationship'
    * Update the ShoutOut.swift (in Model folder) with the relationship
    
    
    ## SAVING & ACCESSING DATA
    ### new classes
    * NSEntityDescription -> Saving Data
    * NSFetchRequest -> Accessing Data
    * NSPredicate -> Filtering Data
    * NSSortDescriptor -> Sorting Data
    
    
    
    ### SAVING DATA
    * First .. to CREATE a new instance of an Entity (like ShoutOut, Employee and so on) we need to use the NSEntityDescription object to INSERT the new object to our context (NSManagedObjectContext)
    
   ```
   let shoutOut = NSEntityDescription.insertNewObject(
    forEntityName: "ShoutOUt",
    into: mainContext) as! ShoutOut
    
    shoutOut.from = "Micke"
    
    do { try mainContext.save() } catch _ {}
*
    
    NOTE the 'as! ShoutOut' at the end of the insertNewObject method call
    The .insertNewObject method returns an NSManagedObject instance.. but we need to cast it to the SUBCLASS we created in the Model folder
    
    See the DataService.swift file (that we created from scratch) to se an implementation of this
    
    
    
    ### RETRIEVING DATA
    We use NSFetchRequest to fetch data
    
```
    let shoutOutsFetchRequest = NSFetchRequest<ShoutOut>(
        entityName: "ShoutOut")
        do {
            let shoutOuts = try mainContext.fetch(shoutOutsFetchRequest)
        } catch {}

    
```    
sdf  
  
  
    
    
    
    
    
    
    
     
    
    
        
        
        
        
    
        
        

