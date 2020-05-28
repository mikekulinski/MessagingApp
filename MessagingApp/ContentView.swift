//
//  ContentView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/21/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var contacts:[Contact] = allContacts
    
    func addContact() {
        contacts.append(Contact(name: "New Thread", imageName: ""))
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(contacts) { contact in
                    NavigationLink(destination: DetailView(contact:contact)) {
                        CellView(contact: contact)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                    leading: Text("Messages").font(.largeTitle).bold(),
                    trailing: Button(action: {
                        self.addContact()
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                )
            }
            
        

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
