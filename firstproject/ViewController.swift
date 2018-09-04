//
//  ViewController.swift
//  firstproject
//
//  Created by Vitali Pekelis on 27/08/2018.
//  Copyright © 2018 my. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var basicLable: UILabel!
    @IBAction func changeLable(_ sender: Any) {
        basicLable.text = "Exciting new value"
    }
    
    @IBAction func changeBakround(_ sender: Any) {
        view.backgroundColor = UIColor.darkGray
        
        //TODO: change the text color of evry lable
        
        //get everything contained in the top level view
        let evrething = view.subviews
        
        for eachView in evrething {
            //is it a lable?
            if eachView is UILabel
            {
                //downcast as UILable
                let eachLable = eachView as! UILabel
                eachLable.textColor = UIColor.green
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //---------------------------------------------------------------------------
    // UITableViewDelegate - implementation
    //---------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TableView on item \(indexPath.row) click")
    }
    
    
    
    let dayliTasks = ["Check all windows",
                      "Check all doors",
                      "Is the boiler fueled?",
                      "Check the mailbox",
                      "Empty trash containers",
                      "If freezing, check water pipes",
                      "Document \"strang and unusual\" occurrences"]
    
    let weeklyTasks = ["Check inside all cabins",
                       "Flush all lavatories in cabins",
                       "Walk the perimeter of property"]
    
    let monthlyTasks = ["Test security alarm",
                        "Test motion detector",
                        "Test smoke alarms"]
    
    //---------------------------------------------------------------------------
    // UITableViewDataSource - implementation
    //---------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dayliTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
            
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        
        cell.textLabel?.text = "This is the \(indexPath.row)"
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dayliTasks[indexPath.row]
            cell.imageView?.image = #imageLiteral(resourceName: "clock")
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = "This is some detailse"
            
            
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
            cell.imageView?.image = nil
            cell.accessoryType = .detailButton
            cell.detailTextLabel?.text = nil
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
            cell.imageView?.image = nil
            cell.accessoryType = .none
            cell.detailTextLabel?.text = nil
        default:
            cell.textLabel?.text = "This shouldn't happen"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}

