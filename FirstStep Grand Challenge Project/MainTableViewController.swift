//
//  MainTableViewController.swift
//  FirstStep Grand Challenge Project
//
//  Created by LAN CHEN on 2/26/17.
//  Copyright © 2017 zhanglong Peng. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var list = ["Sean", "Fido", "Long", "Xiaohui", "Lan"]

    var searchControler : UISearchController!
    
    var resultsController = UITableViewController()
    
    var filteredList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchControler = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchControler.searchBar
        self.searchControler.searchResultsUpdater = self
        //self.searchControler.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        //filter through
        //self.filteredList  = self.list.filter(isIncluded: (String) throws -> Bool  )
        self.filteredList = self.list.filter { (list : String) -> Bool in
            if list.lowercased().contains(self.searchControler.searchBar.text!.lowercased()) {
                
                return true
            }else {
                return false
            }
        }
        
        //update
        self.resultsController.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableView == self.tableView {
            return self.list.count
        }
        else {
            return self.filteredList.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell()
        if tableView == self.tableView {
            cell.textLabel?.text = self.list[indexPath.row]
        }else {
            cell.textLabel?.text = self.filteredList[indexPath.row]
        }

        return cell
    }
    

    
    /*
     make advanced searching....
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     code
     }
     */
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
