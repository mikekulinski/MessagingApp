//
//  ContentView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/21/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var contacts:[Contact] = allContacts
    @State var messageThreads = initialThreads
    @State var showComposeModal: Bool = false

    
    var body: some View {
        NavigationView {
            VStack {
                List(contacts) { contact in
                    NavigationLink(
                        destination: DetailView(contact:contact,
                        messages: self.binding(for: contact))) {
                        CellView(contact: contact)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                    leading: Text("Messages").font(.largeTitle).bold(),
                    trailing: Button(action: {self.showComposeModal = true}) {
                        Image(systemName: "square.and.pencil").imageScale(.large)
                    }
                    .sheet(isPresented: $showComposeModal) {
                        ComposeModalView(threads: self.$contacts, showModal: self.$showComposeModal)
                    }

                )

            }
        }
        // Adds the lines between items in the list
        .onAppear { UITableView.appearance().separatorStyle = .singleLine }
        .onDisappear{ UITableView.appearance().separatorStyle = .none }
    }
    
    private func binding(for key: Contact) -> Binding<[Message]> {
        return .init(
            get: { self.messageThreads[key, default: []]},
            set: { self.messageThreads[key] = $0 }
        )
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
