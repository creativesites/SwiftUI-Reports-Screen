//
//  HeaderView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 30/12/2020.
//

import SwiftUI

struct HeaderView: View {
    @State var address: String = "6336 Culmore Cres."
    var body: some View {
        //Base
        VStack {
            
            HStack {
                VStack {
                
                //6336 Culmore Cres.
                    HStack {
                        Text(self.address).font(.custom("Roboto Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
                            .padding(.leading)
                    }
                    //Last Updated at 12/28/2020.
                        Text("Last Updated at 12/28/2020.").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                            .padding(.leading)

                }
                //.padding()
                Spacer()
                VStack{
                    Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                        .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(180))
                        .padding(.trailing)
                }
                .background(
                    ZStack {
                        Circle()
                        .fill(Color(#colorLiteral(red: 0.9591521621, green: 0.9593163133, blue: 0.9591417909, alpha: 1)))

                        Circle()
                        .strokeBorder(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [60,1000000000]))
                    }
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(70.14))
                    .padding(.trailing)

                )
                .padding()
                //Oval
            }
            
            
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
