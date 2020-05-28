//
//  Contact.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/27/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import Foundation

struct Contact: Identifiable {
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
}

extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.imageName == rhs.imageName
    }
}

let allContacts = [
    Contact(name: "Kim Veldee", imageName: "kim"),
    Contact(name: "Mom", imageName: "mom"),
    Contact(name: "Dad", imageName: "dad"),
    Contact(name: "Unknown", imageName: "")
]
