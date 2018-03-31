//
//  GroupsViewController.swift
//  Breakpoint
//
//  Created by Žan Fras on 25/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [Group]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroups) in
                self.groups = returnedGroups
                self.tableView.reloadData()
            }
        }
    }

}

//MARK: - Table View Extensions
/***************************************************************/
extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        let group = groups[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDescription, memberCount: group.memberCount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedViewController") as? GroupFeedViewController else { return }
        
        let group = groups[indexPath.row]
        
        groupFeedVC.initGroupData(forGroup: group)
        
        present(groupFeedVC, animated: true, completion: nil)
    }
    
}
