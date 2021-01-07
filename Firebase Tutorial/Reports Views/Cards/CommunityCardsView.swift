//
//  CommunityCardsView.swift
//  Firebase Tutorial
//
//  Created by Winston T Chikazhe on 07/01/2021.
//  Copyright © 2021 Balaji. All rights reserved.
//

import SwiftUI

struct CommunityCardsView: View {
    
    @ObservedObject var comms: getCommunityData = getCommunityData()
    var body: some View {
        
        if self.comms.comdatas.count != 0{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){

                                        
                    ForEach(self.comms.comdatas){i in
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                            Image(img)
                                .resizable()
                                //.aspectRatio(contentMode: .fill)
                                .cornerRadius(15)
                                .frame(width: 269, height: 347, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            HStack{
                                Spacer()
                                ZStack {
                                    Button(action: {}) {
                                        
                                        HStack {
                                                
                                            Text(i.category)
                                                .font(.custom("Roboto Regular", size: 10))
                                                .foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1)))
                                                                                        
                                        }
                                        
                                        .padding(.vertical,6)
                                        .padding(.horizontal,25)
                                        .background(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                                        .clipShape(Capsule())
                                    }

                                }
                                .offset(y: -310)
                                
                            }
                            .padding(.trailing)
                            VStack{
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                                    .frame(width: 269, height: 228)
                                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07999999821186066)), radius:48, x:0, y:2)
                                        .offset(y: 10)
                                    HStack{
                                        
                                        VStack(alignment: .leading) {
                                            Text(i.category)
                                                //.font(.title)
                                                .font(.custom("Roboto-Regular", size: 14))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1)))
                                                //.padding()
                                            Text("from").font(.custom("Roboto Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1) + Text("from \(i.dataSource)").font(.custom("Roboto Medium", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                                //.padding(.bottom, 6)
                                            Text(i.description)
                                                .font(.custom("Roboto-Light", size: 14))
                                                .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.51, blue: 0.56, alpha: 1)))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(5)
                                                .allowsTightening(true)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.top, 5)
                                                .padding(.bottom, 40)
                                            
                                            
                                            Button(action: {}) {
                                                
                                                HStack {
                                                    Text("Propzi Impact:")
                                                        .font(.caption)
                                                        .font(.custom("Roboto Regular", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                                        
                                                    Text(i.PropziImpact)
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
                
                }.padding()
                }
                .padding(.horizontal, 20)
                
            }.background(Color("Color").edgesIgnoringSafeArea(.all))

        }
        else{
            
            Loader()
        }

    }
}

struct CommunityCardsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCardsView()
    }
}

//let pics: [String] = ["c", "b", "e", "f"]
//let img: String = pics.randomElement() ?? "c"
