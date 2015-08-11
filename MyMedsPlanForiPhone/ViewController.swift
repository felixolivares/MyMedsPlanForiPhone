//
//  ViewController.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 6/24/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    let kPlanCellIdentifier = "PlanCellIdentifier"
    var myResults : [Plan]!
    
//    var items: [String] = ["We", "Heart", "Swift"]
    let context : NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    func getFectchedResultController() -> NSFetchedResultsController{
        frc = NSFetchedResultsController(fetchRequest: listFecthRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    func listFecthRequest() -> NSFetchRequest{
        let fetchRequest = NSFetchRequest (entityName: "Plan")
        let sortDescriptor = NSSortDescriptor(key: "medicineName", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(rgb: 0x4CAAA0)
        let nib = UINib (nibName: "PlanTableViewCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        myResults = Plan.MR_findAll() as! [Plan]
        print("My results fetched : \(myResults[0].medicineName!)")
        
        frc = getFectchedResultController()
        
        frc.delegate = self
        do{
            try frc.performFetch()
        }catch{
            
        }
        mainTableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        print("Numero de secciones")
        print(frc.sections?[0].numberOfObjects)
        myResults = Plan.MR_findAll() as! [Plan]
        mainTableView.reloadData()
    }

    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        mainTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:PlanTableViewCell = self.mainTableView.dequeueReusableCellWithIdentifier("cell") as! PlanTableViewCell
        cell.nameLabel.text = myResults[indexPath.row].medicineName!
        cell.myTimer = "myTimer\(cell.nameLabel.text!)"
        print("myTimer in main controller" + (cell.myTimer as String))
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        myResults.removeAtIndex(indexPath.row).MR_deleteEntity()
        self.saveContext()
        mainTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myResults.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130;
    }

    func saveContext(){
        (NSManagedObjectContext.MR_defaultContext()).MR_saveToPersistentStoreWithCompletion { (success, error) -> Void in
            if success{
                print("You successfully saved your context.")
                
            }else if (error != nil) {
                print("Error saving context: \(error.description)")
            }
        }
    }
}

