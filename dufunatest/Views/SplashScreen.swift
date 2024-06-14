//
//  SplashScreen.swift
//  dufunatest
//
//  Created by  Apple on 14/06/2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor").ignoresSafeArea()
            HStack {
                Image("SplashIcon" ) .resizable()
                    .frame(width: 36.0, height: 36.0)
                Text("CareSaas").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white).fontWeight(.regular).padding(.leading, 4)
            }.frame( height: 36)
        }
    }
}

#Preview {
    SplashScreen()
}
