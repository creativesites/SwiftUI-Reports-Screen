//
//  testview.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 31/12/2020.
//

import SwiftUI

struct testview: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack{
                    VStack(alignment: .center){
                        Image("Mercedes-W09")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                    }
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    VStack(alignment: .leading){
                        VStack {
                            Text("Employment Rate Decreased").font(.custom("Roboto-Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                .padding(.top, 16)
                                .padding(.leading)
                            
                            Text("Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month. ")
                                .font(.custom("Roboto-Light", size: 14))
                                .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.51, blue: 0.56, alpha: 1))).tracking(1)
                                .multilineTextAlignment(.leading)
                                .lineLimit(5)
                                .allowsTightening(true)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding()

                        }
                        .frame(width: geometry.size.width, height: .infinity, alignment: .center)
                                                
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            //Propzi Impact: + $500
                            
                            HStack {
                                Text("Propzi Impact:  ").font(.custom("Roboto-Regular", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                Text("-$17").font(.custom("Roboto Medium", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.59, green: 0.01, blue: 0.01, alpha: 1)))
                            }
                            .padding()
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .cornerRadius(10)
                            
                            
                                
                                

                        })
                        .padding(.leading)
                        .padding(.bottom)
                        
                                                    
                    }
                    .frame(width: geometry.size.width, height: .infinity, alignment: .center)
                                        
                    
                }
                .background(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07999999821186066)), radius:48, x:0, y:2)
                .cornerRadius(20)
                                
            }
            .frame(width: .infinity, height: .infinity, alignment: .center)
            
            
        }
        .padding()
    }
}

struct testview_Previews: PreviewProvider {
    static var previews: some View {
        testview()
    }
}

