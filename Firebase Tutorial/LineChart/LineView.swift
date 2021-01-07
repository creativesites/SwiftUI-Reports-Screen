//
//  LineView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import SwiftUI

public struct LineView: View {
    @ObservedObject var data: ChartData
    public var title: String?
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    public var valueSpecifier:String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showLegend = false
    @State private var dragLocation:CGPoint = .zero
    @State private var indicatorLocation:CGPoint = .zero
    @State private var closestPoint: CGPoint = .zero
    @State private var opacity:Double = 0
    @State private var currentDataNumber: Double = 0
    @State private var hideHorizontalLines: Bool = false
    @State var myRate = Int(e3)
    let screenWt: CGFloat = UIScreen.main.bounds.size.width
    @State var data2: [Double] = (1...10).map { _ in .random(in: 9.0...52.0) }
    @State var data22: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept"]
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
    private var rateValue: Int?
    
    public init(data: [Double],
                title: String? = nil,
                legend: String? = nil,
                rateValue: Int? = 6,
                style: ChartStyle = Styles.lineChartStyleOne,
                valueSpecifier: String? = "%.1f") {
        
        self.data = ChartData(points: data)
        self.title = title
        self.legend = legend
        self.style = style
        self.rateValue = rateValue
        self.valueSpecifier = valueSpecifier!
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading, spacing: 8) {
                Group{
                    if (self.title != nil){
                        Text(self.title!)
                            .font(.title)
                            .bold().foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.textColor : self.style.textColor)
                    }
                    if (self.legend != nil){
                        Text(self.legend!)
                            .font(.callout)
                            .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.legendTextColor : self.style.legendTextColor)
                    }
                    HStack {
                        Spacer()
                        HStack {
                            
                            if (self.myRate != 0)
                            {
                                if (self.myRate >= 0){
                                    VStack{
                                        Text("$1,254,700")
                                            .font(.custom("Roboto-Regular", size: 12))
                                            .foregroundColor(Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
                                            .padding(.top, 15)
                                        HStack {
                                            Image(systemName: "arrow.up")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor( Color(#colorLiteral(red: 0.17, green: 0.87, blue: 0.28, alpha: 1)))
                                            Text("\(self.myRate)%")
                                                .font(.custom("Roboto-Regular", size: 14))
                                                .foregroundColor( Color(#colorLiteral(red: 0.17, green: 0.87, blue: 0.28, alpha: 1)))
                                        }
                                        .padding(.bottom, 30)
                                        .padding(.top, 10)
                                        
                                        

                                    }
                                    .background(
                                        ZStack{
                                            //Rectangle 11
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(#colorLiteral(red: 0.20392155647277832, green: 0.8156862854957581, blue: 0.7215685844421387, alpha: 0.2199999988079071)))
                                            .frame(width: 83.9, height: 41)
                                        }
                                    )
                                    .padding(.leading)
                                    
                                }else{
                                    VStack{
                                        Text("$1,254,700")
                                            .font(.custom("Roboto-Regular", size: 12))
                                            .foregroundColor(Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
                                            .padding(.top, 15)
                                        HStack {
                                            Image(systemName: "arrow.down")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor( Color(#colorLiteral(red: 0.59, green: 0.01, blue: 0.01, alpha: 1)))
                                            Text("\(self.myRate)%")
                                                .font(.custom("Roboto-Regular", size: 14))
                                                .foregroundColor( Color(#colorLiteral(red: 0.59, green: 0.01, blue: 0.01, alpha: 1)))
                                        }
                                        .padding(.bottom, 10)
                                        
                                        

                                    }
                                    .background(
                                        ZStack{
                                            //Rectangle 11
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(#colorLiteral(red: 0.20392155647277832, green: 0.8156862854957581, blue: 0.7215685844421387, alpha: 0.2199999988079071)))
                                            .frame(width: 83.9, height: 41)
                                        }
                                    )
                                    .padding(.leading)
                                    
                                   
                                }
                                //Text("\(self.rateValue!)%")
                                    
                            }
                            
                            //.padding(.trailing, 20)

                        }
                        .padding(.trailing)
                    }
                }
                .offset(x: 0, y: 0)
                .padding(.bottom, -40)
                ZStack{
                    GeometryReader{ reader in
                        Rectangle()
                            .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                            .frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 195, idealHeight: 240, maxHeight: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        if(self.showLegend){
                            Legend(data: self.data,
                                   frame: .constant(reader.frame(in: .local)), hideHorizontalLines: self.$hideHorizontalLines)
                                .transition(.opacity)
                                .animation(Animation.easeOut(duration: 1).delay(1))
                        }
                        Line(data: self.data,
                             frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: 240)),
                             touchLocation: self.$indicatorLocation,
                             showIndicator: self.$hideHorizontalLines,
                             minDataValue: .constant(nil),
                             maxDataValue: .constant(nil),
                             showBackground: false,
                             gradient: self.style.gradientColor
                        )
                        .offset(x: 30, y: -20)
                        .onAppear(){
                            self.showLegend = true
                        }
                        .onDisappear(){
                            self.showLegend = false
                        }
                        
                                                
                    }
                    .frame(width: geometry.frame(in: .local).size.width, height: 240)
                    .offset(x: 0, y: 40 )
                    MagnifierRect(currentNumber: self.$currentDataNumber, valueSpecifier: self.valueSpecifier)
                        .opacity(self.opacity)
                        .offset(x: self.dragLocation.x - geometry.frame(in: .local).size.width/2, y: 36)
                }
                .frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 195, idealHeight: 195, maxHeight: 195, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)                .gesture(DragGesture()
                .onChanged({ value in
                    self.dragLocation = value.location
                    self.indicatorLocation = CGPoint(x: max(value.location.x-30,0), y: 32)
                    self.opacity = 1
                    self.closestPoint = self.getClosestDataPoint(toPoint: value.location, width: geometry.frame(in: .local).size.width-30, height: 195)
                    self.hideHorizontalLines = true
                })
                    .onEnded({ value in
                        self.opacity = 0
                        self.hideHorizontalLines = false
                    })
                )
            }
        }
    }
    
    func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)
        
        let index:Int = Int(floor((toPoint.x-15)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentDataNumber = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineView(data: e, style: Styles.lineChartStyleP)
            
            
            
        }
    }
}

