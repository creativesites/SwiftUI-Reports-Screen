//
//  CellView.swift
//  Firebase Tutorial
//
//  Created by Kavsoft on 05/01/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CellView : View {
    
    var data : cardData
    @State var show = false
    var body : some View{
        
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                    Image("c")
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                            .cornerRadius(15)
                            .frame(width: 269, height: 347, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        HStack{
                            Spacer()
                            ZStack {
                                Button(action: {}) {
                                    
                                    HStack {
                                            
                                        Text(data.categoryIndicator)
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
                                        Text(data.id)
                                            //.font(.title)
                                            .font(.custom("Roboto-Regular", size: 14))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1)))
                                            //.padding()
                                        Text("from").font(.custom("Roboto Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1) + Text("from  \(data.dataSource)").font(.custom("Roboto Medium", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                            //.padding(.bottom, 6)
                                        Text(data.description)
                                            .font(.custom("Roboto-Light", size: 14))
                                            .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.51, blue: 0.56, alpha: 1)))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(8)
                                            .allowsTightening(true)
                                            .fixedSize(horizontal: false, vertical: false)
                                            .padding(.top, 5)
                                            .padding(.bottom, 40)
                                        
                                        
                                        Button(action: {}) {
                                            
                                            HStack {
                                                Text("Propzi Impact:")
                                                    .font(.caption)
                                                    .font(.custom("Roboto Regular", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                                    
                                                Text(data.PropziImpact)
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
let pics: [String] = ["c", "b", "e", "f"]
let img: String = pics.randomElement() ?? "c"

