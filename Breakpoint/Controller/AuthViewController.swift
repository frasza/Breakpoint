//
//  AuthViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 25/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    //MARK: - Outlets
    /***************************************************************/
    
    //MARK: - Methods
    /***************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    /***************************************************************/
    @IBAction func signInWithEmailButtonPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSigninButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func googleSigninButtonPressed(_ sender: Any) {
        
    }
    
}
