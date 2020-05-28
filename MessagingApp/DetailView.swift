//
//  DetailView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/21/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI


struct DetailView: View {
    let me: Contact = Contact(name: "Mike Kulinski", imageName: "me")
    let contact:Contact
    
    @State var messages:[Message] = [Message(text: "New phone who dis?", contact: allContacts[0]), Message(text: "New phone who dis?", contact: allContacts[0]), Message(text: "New phone who dis?", contact: allContacts[0])]
    
    @State private var currentMessage: String = ""
    
    var body: some View {
        VStack {
            List(messages) { message in
                MessageRowView(message: message, isIncoming: message.contact != self.me)
            }
            TextField("New message",
                text: $currentMessage,
                onCommit:{self.sendMessage()}
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
        .keyboardAdaptive()
        .navigationBarTitle(Text(contact.name), displayMode: .inline)
        
    }
    
    func sendMessage() {
        messages.append(Message(text: currentMessage, contact: me))
        currentMessage = ""
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: allContacts[0])
    }
}
