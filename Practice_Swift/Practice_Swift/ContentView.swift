//
//  ContentView.swift
//  Practice_Swift
//
//  Created by Christopher Wilson on 6/28/20.
//  Copyright © 2020 Christopher Wilson. All rights reserved.
//

import SwiftUI
import Foundation
import Combine





struct ContentView: View {
    @State var selection: Int? = nil
    @State private var isAtMaxScale = false
    private let maxScale:CGFloat = 2
    
    @State private var isAtMaxScale_1 = false
       private let maxScale_1:CGFloat = 2
    private var animation = Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)

    var body: some View {
    
        
        NavigationView {
            ZStack(alignment: .center) {
                 Image("bld")
                .resizable()
                .cornerRadius(20)
                .padding()
                .shadow(radius: 50)
                .opacity(isAtMaxScale ? 1 : 0.6)
                .onAppear(){
                    withAnimation(self.animation, { self.isAtMaxScale.toggle()
                        })
                }
        VStack(alignment: .center, spacing: 30) {
            
            

        NavigationLink(destination: StudentLoginView(), tag: 1, selection: $selection) {
                Button(action: {
                    self.selection = 1
                   print("my nigga")
                
                }) {
                    Text("I am a Student")
                        .font(.custom("Aerial", size: 20))
                        .foregroundColor(Color.blue)
                }
        }
    
      Button(action: {
        print("my niggas")
      }) {
          Text("I am a Teacher")
              .font(.custom("Aerial", size: 20))
              .foregroundColor(Color.black)
      }
    }
            }
               
    .navigationBarTitle(Text("SLGS")
    .font(.custom("Aerial", size: 5))
    .foregroundColor(Color.black), displayMode: .inline
    )
    .navigationBarHidden(false)
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
