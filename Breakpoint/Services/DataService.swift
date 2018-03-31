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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ success: Bool) -> ()) {
        if groupKey != nil {
            // send to groups ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (snapshot) in
            guard let snapshotValues = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in snapshotValues {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            guard let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getEmail(forSearchQuery query: String, handler: @escaping (_ emails: [String]) -> ()) {
        var emailArray = [String]()
        
        REF_USERS.observe(.value) { (snapshot) in
            guard let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && query != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            
            handler(emailArray)
        }
    }
    
    func getIds(forUsernames usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()) {
        REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            var idArray = [String]()
            guard let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if usernames.contains(user.childSnapshot(forPath: "email").value as! String) {
                    idArray.append(user.key)
                }
            }
            
            handler(idArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description: String, forUserIds ids: [String], hander: @escaping (_ complete: Bool) -> ()) {
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": description, "members": ids])
        
        hander(true)
    }
    
    func getAllGroups(handler: @escaping (_ groupsArray: [Group]) -> ()) {
        var groups = [Group]()
        REF_GROUPS.observeSingleEvent(of: .value) { (snapshot) in
            guard let groupsSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for group in groupsSnapshot {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    
                    let group = Group(groupTitle: title, groupDescription: description, key: group.key, memberCount: memberArray.count, members: memberArray)
                    
                    groups.append(group)
                }
            }
            
            handler(groups)
        }
    }
    
}
