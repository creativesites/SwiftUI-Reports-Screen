//
//  LineChartTwo.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import SwiftUI

public struct LineChartTwo: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var data:ChartData
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    
    public var formSize:CGSize
    public var dropShadow: Bool
    public var valueSpecifier:String
    @State private var hideHorizontalLines: Bool = false
    @State private var touchLocation:CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State var data1: [Double] = [70456.00, 706342.00, 707500.00, 705000.00, 705900.00, 708000.00]

    @State private var currentValue: Double = 2 {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    var frame = CGSize(width: 340, height: 120)
    private var rateValue: Int?
    
    public init(data: [Double],
                title: String,
                legend: String? = nil,
                style: ChartStyle = Styles.lineChartStyleOne,
                form: CGSize? = ChartForm.medium,
                rateValue: Int? = 14,
                dropShadow: Bool? = true,
                valueSpecifier: String? = "%.1f") {
        
        self.data = ChartData(points: data)
        self.title = title
        self.legend = legend
        self.style = style
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
        self.formSize = form!
        frame = CGSize(width: 340, height: self.formSize.height/2)
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
        self.rateValue = rateValue
    }
    
    public var body: some View {
        ZStack(alignment: .center){
            
            VStack(alignment: .leading){
                if(!self.showIndicatorDot){
                    
                }else{
                    HStack{
                        Spacer()
                        Text("\(self.currentValue, specifier: self.valueSpecifier)")
                            .font(.system(size: 21, weight: .semibold, design: .default))
                            .offset(x: 0, y: 30)
                        Spacer()
                    }
                    .transition(.scale)
                }
                Spacer()
                GeometryReader{ geometry in
                    /*
                    Legend(data: self.data,
                           frame: .constant(geometry.frame(in: .local)), hideHorizontalLines: self.$hideHorizontalLines)
                        .transition(.opacity)
                        .animation(Animation.easeOut(duration: 1).delay(1))  */
                    Line2(data: self.data,
                         frame: .constant(geometry.frame(in: .local)),
                         touchLocation1: self.$touchLocation,
                         showIndicator: self.$showIndicatorDot,
                         minDataValue: .constant(nil),
                         maxDataValue: .constant(nil)
                    )
                }
                .frame(width: frame.width, height: frame.height )
                //.clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x: 0, y: 0)
            }.frame(width: self.formSize.width, height: self.formSize.height)
        }
        .gesture(DragGesture()
        .onChanged({ value in
            self.touchLocation = value.location
            self.showIndicatorDot = true
            self.getClosestDataPoint(toPoint: value.location, width:self.frame.width, height: self.frame.height)
        })
            .onEnded({ value in
                self.showIndicatorDot = false
            })
        )
    }
    
    @discardableResult func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)
        
        let index:Int = Int(round((toPoint.x)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentValue = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
}

struct LineChartTwo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineChartTwo(data: [707000.00, 707876.00, 707654.00, 707876.00, 707900.00, 707560.00], title: "Line chart", legend: "Basic")
                .environment(\.colorScheme, .light)
            
                    }
    }
}

