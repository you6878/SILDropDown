//
//  ViewController.swift
//  HowlDropdown
//
//  Created by 유명식 on 2018. 4. 24..
//  Copyright © 2018년 유명식. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    var dropDown:DropDown?
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown = DropDown()
        
        // The view to which the drop down will appear on
        dropDown?.anchorView = button // UIView or UIBarButtonItem
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!)
        
        // The list of items to display. Can be changed dynamically
        dropDown?.dataSource = ["Car", "Motorcycle", "Truck"]
        // Do any additional setup after loading the view, typically from a nib.
        button.addTarget(self, action: #selector(dropDownButton), for: .touchUpInside)
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.button.setTitle(item, for: .normal)
        }
        
    }
    @objc func dropDownButton(){
        dropDown?.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

