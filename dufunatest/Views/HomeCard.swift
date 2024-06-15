//
//  HomeCard.swift
//  dufunatest
//
//  Created by  Apple on 15/06/2024.
//

import SwiftUI

struct HomeCard: View {
    var isMed : Bool
    var name : String
    var time: Date
    
    init(isMed: Bool, name: String, time: Date) {
        self.isMed = isMed
        self.name = name
        self.time = time
    }
    
    var body: some View {
        VStack (alignment:.leading) {
            HStack{
                Text(isMed ? "4 Medications to take": "Personal care").foregroundColor(.black)
                Spacer()
                Image("Direction").fontWeight(.semibold).font(.system(size: 16))
            }
            HStack(content: {
                Image("Person").resizable().frame(width: 16, height: 18)
                Text(name).fontWeight(.medium).font(.system(size: 14))
            })
            
            
            HStack(content: {
                
                HStack(content: {
                    HStack(content: {
                        Image("Door").resizable().frame(width: 16, height: 18)
                        Text("Rm 3A").fontWeight(.medium).font(.system(size: 14))
                    }).padding(.trailing, 10)
                   
                    HStack(content: {
                        Image("Bed").resizable().frame(width: 16, height: 18)
                        Text("Bed 45").fontWeight(.medium).font(.system(size: 14))
                    })
                })
                
                Spacer()
                HStack(content: {
                    Image("Clock").resizable().frame(width: 16, height: 18)
                    Text("10:00 AM").fontWeight(.medium).font(.system(size: 14))
                })
            })
            
        }.padding().frame(width: .infinity)
            .background(Color("BoxColor")).cornerRadius(4).padding()
    }
}

#Preview {
    HomeCard(isMed: true, name: "Sunny", time: Date.now)
}
