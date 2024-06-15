//
//  HomeView.swift
//  dufunatest
//
//  Created by  Apple on 15/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var clockedIn : Bool = false
    
    var body: some View {
        VStack(content: {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hi, George!").font(.system(size: 16)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Clock-in to begin your task").font(.system(size: 16)).fontWeight(.regular).foregroundColor(.gray)
                    
                }
                Spacer()
                Image("Noti").resizable().frame(width: 32, height: 32)
            }.padding()
            
            if clockedIn == false { Text("Clock-in")
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
            Spacer()
        })
    }
}

#Preview {
    HomeView()
}
