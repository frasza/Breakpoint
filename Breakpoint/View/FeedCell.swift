//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Žan Fras on 27/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //MARK: - Outlets
    /***************************************************************/
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    //MARK: - Methods
    /***************************************************************/
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
    }
    
}
