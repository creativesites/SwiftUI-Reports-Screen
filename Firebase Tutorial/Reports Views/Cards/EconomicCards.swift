//
//  EconomicCards.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import SwiftUI

struct EconomicCards: View {
    
    @State var index = 0
    @State var economicData: getCardsData = getCardsData()
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 20){
                
                ForEach(datafortest){i in
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                        Image(i.image)
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                            .cornerRadius(15)
                            .frame(width: 269, height: 347, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                                    .frame(width: 121, height: 21)
                                Text("Structure & Exteriors").font(.custom("Abel Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)

                            }
                            .offset(x: 130, y: -310)
                            
                        }
                        VStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                                .frame(width: 269, height: 198)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07999999821186066)), radius:48, x:0, y:2)
                                    .offset(y: 10)
                                HStack{
                                    
                                    VStack(alignment: .leading) {
                                        Text("Employment Rate Decreased")
                                            //.font(.title)
                                            .font(.custom("Roboto-Regular", size: 14))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1)))
                                            //.padding()
                                        Text("from").font(.custom("Roboto Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1) + Text("from Peel Bank Data").font(.custom("Roboto Medium", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                            //.padding(.bottom, 6)
                                        Text("Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month.")
                                            .font(.custom("Roboto-Light", size: 14))
                                            .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.51, blue: 0.56, alpha: 1))).tracking(1)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(5)
                                            .allowsTightening(true)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .padding(.top, 5)
                                            .padding(.bottom, 30)
                                        
                                        
                                        Button(action: {}) {
                                            
                                            HStack {
                                                Text("Propzi Impact:")
                                                    .font(.caption)
                                                    .font(.custom("Roboto Regular", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                                    
                                                Text("Propzi Impact:  ")
                                                    .font(.custom("Roboto Regular", size: 13))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.59, green: 0.01, blue: 0.01, alpha: 1)))
                                                                                            
                                            }
                                            
                                            .padding(.vertical,6)
                                            .padding(.horizontal,25)
                                            .background(Color(.white))
                                            .clipShape(Capsule())
                                        }
                                    }
                                    .padding(.leading)
                                    Spacer()
                                }
                                
                            }
                        }
                        
                    }
                    .frame(width: 269, height: 347, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 25)

        
    }
}




struct  EconomicCards_Previews: PreviewProvider {
    static var previews: some View {
        EconomicCards()
    }
}


struct Type : Identifiable {
    
    var id : Int
    var name : String
    var cName : String
    var price : String
    var image : String
}

var datafortest = [

    Type(id: 0, name: "Rice Stick Noodles", cName: "Italian", price: "$18",image: "c"),
    
    Type(id: 1, name: "Mung Bean Noodles", cName: "Chinese", price: "$29",image: "e")
]
