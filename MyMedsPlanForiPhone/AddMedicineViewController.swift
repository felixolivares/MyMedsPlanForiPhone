//
//  AddMedicineViewController.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 8/6/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit
import CoreData

class AddMedicineViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var medcineNameTextField: UITextField!
    
    @IBOutlet weak var unitsPerDoseTextField: UITextField!

    @IBOutlet weak var medicineEveryTextField: UITextField!
    @IBOutlet weak var otherInfoTextView: UITextView!
    @IBOutlet weak var kindTextField: UITextField!
    
    var plans : [Plan]!
    let hours = ["1","2","3","4","5","6","7","8","9","10","11","12","24",]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
//        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context:NSManagedObjectContext = appDel.managedObjectContext
//        
//        let ent = NSEntityDescription.entityForName("Plan", inManagedObjectContext: context)
//        
//        let newPlan = Plan(entity: ent!, insertIntoManagedObjectContext: context)
//        if self.plan == nil {
//            self.plan = Plan.MR_createEntity()
//        }
        
        let plan = Plan.MR_createEntity() as Plan
        
        plan.medicineName = medcineNameTextField.text;
        plan.medicineKind = kindTextField.text;
        plan.additionalInfo = otherInfoTextView.text
//        newPlan.periodicity = medicineEveryTextField.text
//        newPlan.unitsPerDose = unitsPerDoseTextField.text
//        plans.append(plan)
//        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        self.saveContext()
        
//        do{
//            try context.save()
//            print("Context saved")
//            print(newPlan)
//            
//        }catch{
//            
//        }
        
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
    @IBAction func takeMedicineEvery(sender: AnyObject) {
//        ActionSheetStringPicker.showPickerWithTitle("Select how many hours", rows: hours, initialSelection: 0, doneBlock: { (<#ActionSheetStringPicker!#>, <#Int#>, <#AnyObject!#>) -> Void in
//            <#code#>
//            }, cancelBlock: <#T##ActionStringCancelBlock!##ActionStringCancelBlock!##(ActionSheetStringPicker!) -> Void#>, origin: <#T##AnyObject!#>)
    }
}
