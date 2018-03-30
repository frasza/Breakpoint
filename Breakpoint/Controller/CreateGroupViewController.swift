//
//  CreateGroupViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 29/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMembersLabel: UILabel!
    
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray.removeAll()
            tableView.reloadData() 
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            })
        }
    }
    
    //MARK: - Actions
    /***************************************************************/
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Table View Extension
/***************************************************************/
extension CreateGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        
        if chosenUserArray.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: #imageLiteral(resourceName: "defaultProfileImage"), email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configureCell(profileImage: #imageLiteral(resourceName: "defaultProfileImage"), email: emailArray[indexPath.row], isSelected: false)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLabel.text!) {
            chosenUserArray.append(cell.emailLabel.text!)
            groupMembersLabel.text = chosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({ $0 != cell.emailLabel.text! })
            if chosenUserArray.count > 0 {
                groupMembersLabel.text = chosenUserArray.joined(separator: ", ")
            } else {
                groupMembersLabel.text = "Add people to your group"
                doneButton.isHidden = true
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CreatePostViewController: UITextFieldDelegate { }
