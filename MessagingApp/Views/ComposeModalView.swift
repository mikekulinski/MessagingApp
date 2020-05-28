//
//  ComposeModalView.swift
//  MessagingApp
//
//  Created by Mike Kulinski on 5/28/20.
//  Copyright © 2020 Mike Kulinski. All rights reserved.
//

import SwiftUI

struct ComposeModalView: View {
    @State private var name: String = ""
    @State private var imageName: String = ""
    
    @Binding var threads:[Contact]
    @Binding var showModal:Bool
    
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading, spacing: 10){
                Text("New Message")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                
                TextField("Contact Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Image Name", text: $imageName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Button(action: {
                self.createMessageThread()
            }) {
                Text("Done")
                    .font(.headline)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    
            }
            
            Spacer()
        }
        .padding(.top)

    }
    
    func createMessageThread() {
        threads.append(
            Contact(name: name == "" ? "Unknown" : name,
                    imageName: imageName == "" ? "Unknown" : imageName))
        
        self.showModal = false
    }
}


struct ComposeModalView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
      @State var threads: [Contact] = [Contact(name: "Kim Veldee", imageName: "kim")]
    @State var showModal: Bool = true

      var body: some View {
        ComposeModalView(threads: $threads, showModal: $showModal)
      }
    }
}
