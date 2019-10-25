//
//  CoursesController.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 25/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit

class CoursesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "DataStartedDownloading") , object: nil, queue: nil) { (notification) in
            DispatchQueue.main.async {
                print("DataStartedDownloading")
                
                let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium) // creating an activity indicator while data is loading
                activityIndicator.startAnimating()
                self.navigationItem.rightBarButtonItem?.customView = activityIndicator
            }
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "DataUpdated") , object: nil, queue: nil) { (notification) in
            DispatchQueue.main.async {
               self.navigationItem.title = Model.sharedInstance.currentDate
               self.tableView.reloadData()
                let barButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(self.refreshButtonPressed(_:))) // switching activity indicator back to button when data is loaded succesfully
                self.navigationItem.rightBarButtonItem = barButtonItem
            }
        }
        
        self.navigationItem.title = Model.sharedInstance.currentDate
        Model.sharedInstance.loadXML(date: nil)
    }
    

    @IBAction func refreshButtonPressed(_ sender: Any) {
        Model.sharedInstance.loadXML(date: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.sharedInstance.currencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currCourseForCell = Model.sharedInstance.currencies[indexPath.row]
        
        cell.textLabel?.text = currCourseForCell.Name!
        cell.detailTextLabel?.text = currCourseForCell.Value!
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
