//
//  Graph.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 04/01/2021.
//

import SwiftUI
//import Shapes
//import Charts

struct Graph: View {
    let lineChartStyleTwo = ChartStyle(
        backgroundColor: .clear,
        accentColor: Color(#colorLiteral(red: 0.20392157137393951, green: 0.8156862854957581, blue: 0.7215686440467834, alpha: 1)),
        secondGradientColor: Color(#colorLiteral(red: 0.20392157137393951, green: 0.8156862854957581, blue: 0.7215686440467834, alpha: 1)),
        textColor: Color.black,
        legendTextColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)),
        dropShadowColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
    let lineChartStyleThree = ChartStyle(
        backgroundColor: .clear,
        accentColor: Color(#colorLiteral(red: 0.5912932158, green: 0.5913978219, blue: 0.5912865996, alpha: 1)),
        secondGradientColor: Color(#colorLiteral(red: 0.5912932158, green: 0.5913978219, blue: 0.5912865996, alpha: 1)),
        textColor: Color.black,
        legendTextColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)),
        dropShadowColor: Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
    @State var d: [Double] =  [8,23,30,33,18,30]
    @State var e: [Double] = [9,27,34,32,22,27]
    @State var data2: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept"]
    var body: some View {
        HStack {
            
            VStack {
                //Propzi Value
                
                ZStack {
                    Group {
                        ZStack {
                            
                            LineView(data: e, style: lineChartStyleTwo)
                            LineView2(data: d, style: lineChartStyleThree)
                                .offset(x: 0, y: 30)
                                   
                               }
                        }
                        }
                .frame(width: .infinity, height: 195)
                /*
                AxisLabels(.horizontal, data: data2, id: \.self) {
                    Text("\($0)")
                        .fontWeight(.bold)
                        .font(Font.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .frame(height: 20)
                .padding(.horizontal, 1)
                .padding(.top, -5)
                */
            }
        }
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        Graph()
            .padding(.horizontal)
    }
}

