//
//  LineView2.swift
//  charts swiftui
//
//  Created by Winston T Chikazhe on 04/01/2021.
//

import SwiftUI

public struct LineView2: View {
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
    @State var myRate = Int(d3)
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
    let d = [8,23,30,33,18,30]
    private var rateValue: Int?
    
    public init(data: [Double],
                title: String? = nil,
                legend: String? = nil,
                rateValue: Int? = 4,
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
                
                ZStack{
                    GeometryReader{ reader in
                        Rectangle()
                            .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                            .frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 195, idealHeight: 240, maxHeight: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        /*
                        if(self.showLegend){
                            Legend(data: self.data,
                                   frame: .constant(reader.frame(in: .local)), hideHorizontalLines: self.$hideHorizontalLines)
                                .transition(.opacity)
                                .animation(Animation.easeOut(duration: 1).delay(1))
                        }  */
                        Line(data: self.data,
                             frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: reader.frame(in: .local).height)),
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
                    .frame(width: geometry.frame(in: .local).size.width, height: 195)
                    .offset(x: 0, y: 40 )
                    MR2(currentNumber: self.$currentDataNumber, valueSpecifier: self.valueSpecifier)
                        .opacity(self.opacity)
                        .offset(x: self.dragLocation.x - geometry.frame(in: .local).size.width/2, y: 36)  
                }
                .frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 195, idealHeight: 195, maxHeight: 195, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .gesture(DragGesture()
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

struct LineView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineView2(data: d, style: Styles.lineChartStyleOne)
            
            
            
        }
    }
}

 var d: [Double] =  [18,13,15,18,17,14]
var e: [Double] = [19,17,14,22,17,12]
var d1: Double = d[d.count - 1]
var d2: Double = d[d.count - 2]
var e1: Double = e[e.count - 1]
var e2: Double = e[e.count - 2]
var d3: Double = d1 - d2
var e3: Double = e1 - e2

