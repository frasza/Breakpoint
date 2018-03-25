//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Žan Fras on 25/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 5
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        super.awakeFromNib()
    }

}
