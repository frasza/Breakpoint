//
//  CreatePostViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 27/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit
import Firebase

class CreatePostViewController: UIViewController {
    
    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    //MARK: - Methods
    /***************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Actions
    /***************************************************************/
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if textView.text != "" && textView.text != "Say something here..." {
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (success) in
                if success {
                    self.sendButton.isEnabled = true
                    self.textView.text = ""
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("There was an error.")
                }
            })
        }
    }
    
}

//MARK: - Text View Extensions
/***************************************************************/
extension CreatePostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
