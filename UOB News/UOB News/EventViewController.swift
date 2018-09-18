//
//  EventViewController.swift
//  UOB News
//
//  Created by Benjamin Inemugha on 29/08/2018.
//  Copyright © 2018 University of Birmigham. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sideMenus() {
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 200
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
