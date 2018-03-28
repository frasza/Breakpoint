//
//  Message.swift
//  Breakpoint
//
//  Created by Žan Fras on 28/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import Foundation

class Message {
    
    public private(set) var content: String
    public private(set) var senderId: String
    
    init(content: String, senderId: String) {
        self.content = content
        self.senderId = senderId
    }
    
}
