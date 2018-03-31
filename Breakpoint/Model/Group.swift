//
//  Group.swift
//  Breakpoint
//
//  Created by Žan Fras on 31/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import Foundation

class Group {
    
    public private(set) var groupTitle: String
    public private(set) var groupDescription: String
    public private(set) var key: String
    public private(set) var memberCount: Int
    public private(set) var members: [String]
    
    init(groupTitle: String, groupDescription: String, key: String, memberCount: Int, members: [String]) {
        self.groupTitle = groupTitle
        self.groupDescription = groupDescription
        self.key = key
        self.memberCount = memberCount
        self.members = members
    }
    
}
