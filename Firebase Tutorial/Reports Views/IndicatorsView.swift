//
//  IndicatorsView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 31/12/2020.
//

import SwiftUI

struct IndicatorsView: View {

   var indicatorsEconomic = IndicatorsData
   @State var showContent = false
    @State var showIndicators = false
   var body: some View {
      
            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 20.0) {
                  ForEach(indicatorsEconomic) { item in
                     Button(action: { self.showContent.toggle() }) {
                        GeometryReader { geometry in
                            IndicatorView(indicator: item.indicator,
                                          area: item.area,
                                          category: item.category,
                                          rate: item.rate,
                                          ImpactOnPropziPrice: item.ImpactOnPropziPrice
                                          )
                              .rotation3DEffect(Angle(degrees:
                                 Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                              //.sheet(isPresented: self.$showContent) { ContentView() }
                        }
                        .frame(width: 300, height: 200)
                     }
                  }
               }
               .padding(.leading, 30)
               .padding(.top, 30)
               .padding(.bottom, 70)
               Spacer()
            }
            
        
   }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
   static var previews: some View {
    IndicatorsView()
   }
}
#endif

struct IndicatorView: View {

   var indicator = "Economic Index"
   var area = "Annex"
   var category = "Provincial Economics"
   var rate = "8.4%"
    var ImpactOnPropziPrice = "+0.56%"

   var body: some View {
      return VStack(alignment: .leading) {
         Text(indicator)
            .font(.custom("Roboto Medium", size: 16))
            .foregroundColor(.primary)
            .padding(30)
            .lineLimit(4)

         Spacer()

        HStack {
            Text("Area: ")
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)
            Text(area)
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)        }
        HStack {
            Text("Category: ")
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)
            Text(category)
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)

        }
        HStack {
            Text("Rate: ")
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(10)
            Text(rate)
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)
        }
        HStack {
            Text("Impact on Propzi Price:")
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(.horizontal, 10)
            Text(ImpactOnPropziPrice)
                .font(.custom("Roboto Medium", size: 16))
                .foregroundColor(.primary)
                .padding(10)
        }
      }
      .background(Color(#colorLiteral(red: 0.9485213161, green: 0.9731468558, blue: 0.9869430661, alpha: 1)))
      .cornerRadius(30)
      .frame(width: 300, height: 200)
      .shadow(color: Color(#colorLiteral(red: 0.9591521621, green: 0.9593163133, blue: 0.9591417909, alpha: 1)), radius: 20, x: 0, y: 20)
   }
}

struct Indicator: Identifiable {
   var id = UUID()
   var indicator: String
    var ImpactOnPropziPrice: String
    var area: String
    var category: String
    var rate: String
   //var color: Color
   //var shadowColor: Color
}

let IndicatorsData = [
    Indicator( indicator: "Peel Unemployment Rate", ImpactOnPropziPrice: "-0.29%", area: "Peel", category: "Local Economics", rate: "11.3%"),
    Indicator( indicator: "Peel Unemployment Rate", ImpactOnPropziPrice: "-0.29%", area: "Peel", category: "Local Economics", rate: "11.3%")
        ]

