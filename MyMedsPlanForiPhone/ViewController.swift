//
//  ViewController.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 6/24/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    let kPlanCellIdentifier = "PlanCellIdentifier"
    var items: [String] = ["We", "Heart", "Swift"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(rgb: 0x4CAAA0)
        let nib = UINib (nibName: "PlanTableViewCell", bundle: nil)
        mainTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:PlanTableViewCell = self.mainTableView.dequeueReusableCellWithIdentifier("cell") as! PlanTableViewCell
        
        print(self.items[indexPath.row])
        cell.nameLabel.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count 
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }

    
}

