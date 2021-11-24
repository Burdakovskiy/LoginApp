//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    var user: User!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = user.person.getFullName
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
