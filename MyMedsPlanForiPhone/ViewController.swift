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
    var items: [String] = ["We", "Heart", "Swift"]
    let context : NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    func getFectchedResultController() -> NSFetchedResultsController{
        frc = NSFetchedResultsController(fetchRequest: listFecthRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    func listFecthRequest() -> NSFetchRequest{
        let fetchRequest = NSFetchRequest (entityName: "Plan")
        let sortDescriptor = NSSortDescriptor(key: "medicineName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(rgb: 0x4CAAA0)
        let nib = UINib (nibName: "PlanTableViewCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        frc = getFectchedResultController()
        
        frc.delegate = self
        do{
            try frc.performFetch()
        }catch{
            
        }
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
        
        print(self.items[indexPath.row])
        
        let plan = frc.objectAtIndexPath(indexPath) as! Plan
        
        cell.nameLabel.text = plan.medicineName
        cell.myTimer = String(format: "myTimer%d", indexPath.row)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let managedObject : NSManagedObject = frc.objectAtIndexPath(indexPath) as! NSManagedObject
        context.deleteObject(managedObject)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130;
    }

    
}

