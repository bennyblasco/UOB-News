//
//  DisplayViewController.swift
//  UOB News
//
//  Created by Benjamin Inemugha on 24/07/2018.
//  Copyright © 2018 University of Birmigham. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var item: RSSItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUI()
        displayLabel.text = item?.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setUI() {
//        displayLabel.text = item?.description
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
