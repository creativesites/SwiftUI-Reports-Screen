//
//  ChartTopView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 05/01/2021.
//

import SwiftUI

struct ChartTopView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Propzi Value").font(.custom("Roboto Medium", size: 24))
                    .padding(.leading)
                Spacer()
                VStack{
                    //Date
                    HStack {
                        Text("Date").font(.custom("Catamaran Medium", size: 14))
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 10, height: 10)
                    }
                    .padding(.trailing)
                }
                .background(
                    ZStack{
                        //Rectangle 11
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(#colorLiteral(red: 0.9458333253860474, green: 0.9458333253860474, blue: 0.9458333253860474, alpha: 1)))
                        .frame(width: 88, height: 30)
                    }
                    .padding(.trailing)
                )
                .padding(.trailing)
            }
            .padding(.top)
            HStack{
                HStack {
                //6336 Culmore Cres
                    Text("6336 Culmore Cres").font(.custom("Roboto Medium", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.82, blue: 0.72, alpha: 1)))

                //Ellipse 29
                    Circle()
                    .fill(Color(#colorLiteral(red: 0.20392157137393951, green: 0.8156862854957581, blue: 0.7215686440467834, alpha: 1)))
                    .frame(width: 11, height: 11)
                }
                .padding()
                Spacer()
                HStack {
                    //Ellipse 29
                        Circle()
                        .fill(Color(#colorLiteral(red: 0.5920000076293945, green: 0.5920000076293945, blue: 0.5920000076293945, alpha: 1)))
                        .frame(width: 11, height: 11)
                //Avg. Market Price
                    Text("Avg. Market Price").font(.custom("Roboto Medium", size: 12)).foregroundColor(Color(#colorLiteral(red: 0.59, green: 0.59, blue: 0.59, alpha: 1)))

                
                }
                Spacer()
                }
            
            .padding(.top)
        }
    }
}

struct ChartTopView_Previews: PreviewProvider {
    static var previews: some View {
        ChartTopView()
    }
}
