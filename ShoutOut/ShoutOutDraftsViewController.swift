//
//  ViewController.swift
//  ShoutOut

import UIKit
import CoreData

class ShoutOutDraftsViewController: UIViewController,
									UITableViewDataSource,
									UITableViewDelegate,
                                    ManagedObjectContextDependentType {

	@IBOutlet weak var tableView: UITableView!
    var managedObjectContext: NSManagedObjectContext!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: TableView Data Source methods
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return nil
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath)
		
		cell.textLabel?.text = "Jane Sherman"
		cell.detailTextLabel?.text = "Great Job!"
		
		return cell
	}
	
	// MARK: TableView Delegate methods
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
    case "shoutOutDetails":
            let destinationVC = segue.destination as! ShoutOutDetailsViewController
            destinationVC.managedObjectContext = self.managedObjectContext
    case "addShoutOut":
        let navigationController = segue.destination as! UINavigationController
            let destinationVC = navigationController.viewControllers[0] as! ShoutOutEditorViewController
            destinationVC.managedObjectContext = self.managedObjectContext
        default:
            break
        }
	}
}
