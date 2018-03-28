//
//  MeViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 27/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit
import Firebase

class MeViewController: UIViewController {
    
    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    //MARK: - Methods
    /***************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailLabel.text = Auth.auth().currentUser?.email
    }
    
    //MARK: - Actions
    /***************************************************************/
    @IBAction func signOutButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Logout", style: .destructive) { (action) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print("Error loging out!")
            }
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

}
