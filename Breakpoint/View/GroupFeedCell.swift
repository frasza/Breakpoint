//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Žan Fras on 31/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage image: UIImage, email: String, content: String) {
        self.profileImage.image = image
        self.emailLabel.text = email
        self.contentLabel.text = content
    }

}
