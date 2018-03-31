//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Žan Fras on 31/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLabel.text = title
        self.groupDescriptionLabel.text = description
        self.membersLabel.text = "\(memberCount) members"
    }
    
}
