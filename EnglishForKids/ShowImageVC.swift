//
//  ShowImageVC.swift
//  EnglishForKids
//
//  Created by techmaster on 1/18/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var lblNameImage: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var lblName: String?
    var imgName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = UIImage(named: imgName!)
        lblNameImage.text = lblName
        
    }

}
