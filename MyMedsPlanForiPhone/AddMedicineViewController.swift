//
//  AddMedicineViewController.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 8/6/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit
import CoreData

class AddMedicineViewController: UIViewController {

    @IBOutlet weak var medcineNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveAction(sender: AnyObject) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let ent = NSEntityDescription.entityForName("Plan", inManagedObjectContext: context)
        
        let newPlan = Plan(entity: ent!, insertIntoManagedObjectContext: context)
        
        newPlan.medicineName = medcineNameTextField.text;
        
        do{
            try context.save()
            print("Context saved")
            print(newPlan)
            
        }catch{
            
        }
        
        
        
    }
}
