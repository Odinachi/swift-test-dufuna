//
//  ContentView.swift
//  dufunatest
//
//  Created by  Apple on 14/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive:Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack{
                if self.isActive {
                    LoginScreen()
                } else {
                    SplashScreen()
                }
            }
           .onAppear {
                //splash only last for 3secs
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               
                    withAnimation {
                        self.isActive = true
                    }
                }
            
       }
        }
    }
}

#Preview {
    
    ContentView()
}
