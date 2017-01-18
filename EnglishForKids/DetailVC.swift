//
//  DetailVC.swift
//  EnglishForKids
//
//  Created by techmaster on 1/17/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = stringTitle
        
        createDataWithName(title: stringTitle)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func createDataWithName(title: String) {
        var path: String = ""
        if title == "Fruits" {
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if title == "Animals" {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        if title == "Persons" {
            path = Bundle.main.path(forResource: "PersonsList", ofType: "plist")!
        }
        if title == "Trees" {
            path = Bundle.main.path(forResource: "TreesList", ofType: "plist")!
        }
        
        dictData = NSDictionary(contentsOfFile: path)
        arrayKeys = dictData.allKeys as! [String]
        arrayKeys = arrayKeys.sorted()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let key: String = arrayKeys[indexPath.row]
        
        cell.textLabel?.text = key
        
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    // MARK: Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
        let showImageVC = storyboard?.instantiateViewController(withIdentifier: "showImageVC") as! ShowImageVC
        let key: String = arrayKeys[indexPath.row]
        showImageVC.imgName = dictData[key] as? String
        showImageVC.lblName = key
        
        navigationController?.pushViewController(showImageVC, animated: true)
    }

}
