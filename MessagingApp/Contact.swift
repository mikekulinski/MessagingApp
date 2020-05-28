//
//  Contact.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/27/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import Foundation

struct Contact: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name:String
    let imageName:String
    
    init(name:String, imageName: String) {
        self.name = name
        
        if imageName == "" {
            self.imageName = "unknown"
        } else {
            self.imageName = imageName
        }
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.imageName == rhs.imageName
    }
}

let me = Contact(name: "Mike Kulinski", imageName: "")

let allContacts = [
    Contact(name: "Kim Veldee", imageName: "Kim"),
    Contact(name: "Mom", imageName: "Mom"),
    Contact(name: "Dad", imageName: "Dad")
]


var initialThreads: Dictionary<Contact, [Message]> = [
    Contact(name: "Kim Veldee", imageName: "Kim"): [
        Message(text: "Yo wazzup!", contact: allContacts[0]),
        Message(text: "New phone who dis? ", contact: me),
        Message(text: "This is your main man Kim", contact: allContacts[0])
    ]
]
