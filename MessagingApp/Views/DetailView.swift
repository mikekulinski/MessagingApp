//
//  DetailView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/21/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI


struct DetailView: View {
    let contact:Contact
    
    @Binding var messages:[Message]
    @State private var currentMessage: String = ""
    
    init(contact:Contact, messages:Binding<[Message]>) {
        self.contact = contact
        _messages = messages
        
        
        
    }
    
    var body: some View {
        VStack {
            List(messages) { message in
                MessageRowView(message: message, isIncoming: message.contact != me)
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
            
        // Removes all the lines between items in the list
        .onAppear { UITableView.appearance().separatorStyle = .none }
        .onDisappear{ UITableView.appearance().separatorStyle = .singleLine }
        
    }
    
    
    func sendMessage() {
        messages.append(Message(text: currentMessage, contact: me))
        currentMessage = ""
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State var messages = initialThreads[allContacts[0]]!

      var body: some View {
        DetailView(contact: allContacts[0], messages: $messages)
      }
    }
}
