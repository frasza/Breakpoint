//
//  DataService.swift
//  Breakpoint
//
//  Created by Žan Fras on 25/03/2018.
//  Copyright © 2018 Žan Fras. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    public private(set) var REF_BASE = DB_BASE
    public private(set) var REF_USERS = DB_BASE.child("users")
    public private(set) var REF_GROUPS = DB_BASE.child("groups")
    public private(set) var REF_FEED = DB_BASE.child("feed")
    
    func createUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
