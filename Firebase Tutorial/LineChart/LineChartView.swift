//
//  LineCard.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//
import SwiftUI

public struct LineChartView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var data:ChartData
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    @State private var showLegend = false
    public var formSize:CGSize
    public var dropShadow: Bool
    public var valueSpecifier:String
    @State private var hideHorizontalLines: Bool = true
    @State private var touchLocation:CGPoint = .zero
    @State private var touchLocation1:CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State var data1: [Double] = [70456.00, 706342.00, 707500.00, 705000.00, 705900.00, 708000.00]

    @State private var currentValue: Double = 700000 {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    @State private var currentValue1: Double = 700000 {
        didSet{
            if (oldValue != self.currentValue1 && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    var frame = CGSize(width: 300, height: 120)
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
                    VStack{
                        HStack {
                            if(self.showIndicatorDot){
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Your Propzi Price: \(self.currentValue, specifier: self.valueSpecifier)")
                                        .font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                    Text("Average House Price: \(self.currentValue1, specifier: self.valueSpecifier)")
                                        .font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                                                            }
                            }
                            Spacer()
                            
                            VStack{
                                Text(self.legend!)
                                    .font(.custom("Roboto-Regular", size: 12))
                                    .foregroundColor(Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
                                    .padding(.top, 15)
                                HStack {
                                    Image(systemName: "arrow.up")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor( Color(#colorLiteral(red: 0.17, green: 0.87, blue: 0.28, alpha: 1)))
                                    Text("\(self.rateValue!)%")
                                        .font(.custom("Roboto-Regular", size: 14))
                                        .foregroundColor( Color(#colorLiteral(red: 0.17, green: 0.87, blue: 0.28, alpha: 1)))
                                }
                                .padding(.bottom, 10)
                            }
                            .background(
                                ZStack{                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(#colorLiteral(red: 0.20392155647277832, green: 0.8156862854957581, blue: 0.7215685844421387, alpha: 0.2199999988079071)))
                                    .frame(width: 83.9, height: 43)
                                }
                            )
                            .padding(.trailing)
                            
                        }
                        
                    }
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .transition(.opacity)
                    .animation(.easeIn(duration: 0.1))
                    .padding([.leading, .top])
                
                //Spacer()
                GeometryReader{ geometry in
                    /*
                     */
                    ZStack {
                        Legend(data: self.data,
                               frame: .constant(geometry.frame(in: .local)), hideHorizontalLines: self.$hideHorizontalLines)
                            .transition(.opacity)
                            .animation(Animation.easeOut(duration: 1).delay(1))
                            //.padding(.trailing)
                            .offset(x: -20, y: 20)
                        Line(data: self.data,
                             frame: .constant(geometry.frame(in: .local)),
                             touchLocation: self.$touchLocation,
                             showIndicator: self.$showIndicatorDot,
                             minDataValue: .constant(nil),
                             maxDataValue: .constant(nil)
                        )
                        .padding(.leading, 30)
                        Line2(data: ChartData(points: [704000.00, 704876.00, 704654.00, 704876.00, 704900.00, 704560.00]),
                             frame: .constant(geometry.frame(in: .local)),
                             touchLocation1: self.$touchLocation,
                             showIndicator: self.$showIndicatorDot,
                             minDataValue: .constant(nil),
                             maxDataValue: .constant(nil)
                        )
                        .padding(.leading, 20)
                        .offset(x: 20, y: 20)
                    }
                }
                .frame(width: frame.width, height: frame.height )
                //.clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x: 0, y: 0)
            }.frame(width: self.formSize.width, height: self.formSize.height)
        }
        .gesture(DragGesture()
        .onChanged({ value in
            self.touchLocation = value.location
            self.touchLocation1 = value.location
            self.showIndicatorDot = true
            self.getClosestDataPoint(toPoint: value.location, width:self.frame.width, height: self.frame.height)
            self.getClosestDataPoint1(toPoint: value.location, width:self.frame.width, height: self.frame.height)
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
    
    @discardableResult func getClosestDataPoint1(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = [704000.00, 704876.00, 704654.00, 704876.00, 704900.00, 704560.00]
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)
        
        let index:Int = Int(round((toPoint.x)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentValue1 = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                LineChartView(data: [708000, 708876, 708654, 708876, 708900, 708560], title: "Line chart", legend: "Basic")
                    .environment(\.colorScheme, .light)
                
                
            }
            
        }
    }
}
