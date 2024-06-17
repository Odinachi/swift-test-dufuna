//
//  HomeView.swift
//  dufunatest
//
//  Created by  Apple on 15/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var clockedIn : Bool = false
    
    @State private var selectedTab = 0
    
  @StateObject var viewModel = AppViewModel.shared
    
    var body: some View {
       
        VStack(content: {
            HStack {
                VStack(alignment: .leading) {
                    
                    
                    Text("Hi, \(viewModel.user?.data?.user?.givenName ?? "")!").font(.system(size: 16)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Clock-in to begin your task").font(.system(size: 16)).fontWeight(.regular).foregroundColor(.gray)
                    
                }
                Spacer()
                Image("Noti").resizable().frame(width: 32, height: 32)
            }.padding()
            
            if !clockedIn{ Text("Clock-in")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 13)).fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("PrimaryColor"))
                    .cornerRadius(4)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)).onTapGesture {
                        clockedIn = true
                    } } else {
                        HStack {
                            Text("Take a Break")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 13)).fontWeight(.bold)
                                .padding()
                                .foregroundColor(.white)
                                .background(.yellow)
                                .cornerRadius(4)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            Text("Clock-out")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 13)).fontWeight(.bold)
                                .padding()
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(4)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                        }.onTapGesture {
                            clockedIn = false
                        } }
            
            
            VStack {
                HStack(content: {
                    
                    HStack {
                        Spacer()
                        Text("Medication").foregroundColor(Color(selectedTab == 0 ? "PrimaryColor" : "Gray")).fontWeight(.bold).font(.system(size: 13))
                        Spacer()
                    }.onTapGesture {
                        selectedTab = 0
                    }
                    HStack {
                        Spacer()
                        Text("Activities").foregroundColor(Color(selectedTab == 1 ? "PrimaryColor" : "Gray")).fontWeight(.bold).font(.system(size: 13))
                        Spacer()
                    }.onTapGesture {
                        selectedTab = 1
                    }
                    
                }).animation(.easeInOut, value: selectedTab)
                HStack (spacing: 0) {
                    
                    Rectangle().frame(width: .infinity, height: 2).foregroundColor(Color(selectedTab == 0 ? "PrimaryColor" : "Gray"))
                    
                    Rectangle().frame(width: .infinity, height: 2).foregroundColor(Color(selectedTab == 1 ? "PrimaryColor" : "Gray"))
                    
                }.animation(.easeInOut, value: selectedTab)
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            
            HomeCard(isMed: true, name: "Sunny", time: Date.now)
            Spacer()
        }).onAppear(perform: {
            viewModel.fetchHomeData()
        })
    }
}

#Preview {
    HomeView()
}
