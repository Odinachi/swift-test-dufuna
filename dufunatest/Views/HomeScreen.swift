//
//  HomeScreen.swift
//  dufunatest
//
//  Created by  Apple on 14/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedTab = 0
    
   
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab, content: {
                HomeView() .tabItem {
                    Label("Home", systemImage: "house")
                    
                }.tag(0)
                Text("Search Screen") .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                    
                }.tag(1)
                Text("Account Screen") .tabItem {
                    Color.black.frame(width: 200, height: 10)
                    VStack {
                        Image("Placeholder").resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFit()
                        Text("Account")
                    }
                }.tag(2)
            }).accentColor(Color("PrimaryColor"))
            VStack(spacing: 0) {
                Spacer()
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(Color("Gray"))
                
                
                HStack {
                    Rectangle()
                        .frame(maxWidth: 50, maxHeight: 3)
                        .foregroundColor(Color("PrimaryColor")).cornerRadius(30)
                        .padding(.bottom, 55)
                    
                } .padding(.leading, 40).padding(.trailing, 40).frame(maxWidth: .infinity, alignment: selectedTab == 0 ? .leading : selectedTab == 1 ?  .center : .trailing ) .animation(.easeInOut, value: selectedTab)
            }
            
        } .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeScreen()
}

