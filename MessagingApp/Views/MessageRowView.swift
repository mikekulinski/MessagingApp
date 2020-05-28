//
//  MessageRowView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/27/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI

struct Message: Identifiable{
    let id = UUID()
    let text: String
    let contact: Contact
}

struct MessageRowView: View {
    var message: Message
    var isIncoming: Bool
    
    init(message:Message, isIncoming:Bool) {
        self.message = message
        self.isIncoming = isIncoming
    }
    
    
    var body: some View {
        if self.isIncoming {
            return Text(message.text)
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                )
                .frame(maxWidth: .infinity, alignment: .leading)
        } else {
            return Text(message.text)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.blue)
            )
                .frame(maxWidth: .infinity, alignment: .trailing)
                
        }
        
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(message: Message(text: "New phone who dis?", contact: allContacts[0]), isIncoming: false)
    }
}
