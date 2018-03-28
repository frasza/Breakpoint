//
//  FeedViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 25/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    /***************************************************************/
    var messageArray = [Message]()
    
    //MARK: - Methods
    /***************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllFeedMessages { (returnedMessages) in
            self.messageArray = returnedMessages.reversed()
            self.tableView.reloadData()
        }
    }

}

//MARK: - Table View Extension
/***************************************************************/
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedCell else { return UITableViewCell() }
        
        let image = #imageLiteral(resourceName: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image, email: returnedUsername, content: message.content)
        }
        
        return cell
    }
    
}
