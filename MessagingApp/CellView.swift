//
//  CellView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/27/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var contact:Contact
    var body: some View {
        HStack {
            VStack{
                Image(contact.imageName)
                .resizable()
                .scaledToFill()
            }
            .clipShape(Circle())
            .frame(width: 75, height: 75)
            Text(contact.name)
            .padding()
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(contact: allContacts[0])
    }
}
