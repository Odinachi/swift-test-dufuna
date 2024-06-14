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
        
        VStack{
            if self.isActive {
                LoginScreen()
            } else {
                SplashScreen()
            }
        }
       .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           
                withAnimation {
                    self.isActive = true
                }
            }
        
    }
    }
}

#Preview {
    ContentView()
}
