//
//  MasterTableVC.swift
//  EnglishForKids
//
//  Created by techmaster on 1/17/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    
    var dictList = ["Fruits": "fruits", "Animals": "animals.jpeg", "Trees": "trees.png", "Persons": "persons.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var arrayKey = Array(dictList.keys)
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as! DetailVC
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let selectedCell: UITableViewCell = self.tableView.cellForRow(at: selectedRowIndex as IndexPath)!
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
    
}
