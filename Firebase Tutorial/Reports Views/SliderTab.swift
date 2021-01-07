//
//  SliderTab.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 30/12/2020.
//

import SwiftUI
import Firebase
//import SwiftUICharts
//import Shapes
//import Charts
struct SliderTab: View {
    @State var index = "ALL"
    @State var tab = 0
    @State var showIndicators11 = true
    @State var showIndicators22 = false
    @State var showIndicators33 = false
    @State var showIndicators44 = false
    
    //@State var showIndicators1 = false
    //@State var showIndicators2 = false
    //@State var showIndicators3 = false
    @State private var isPressed: Bool = false
    //@Binding var detailData : Watch
    //@Binding var detail : Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    var body: some View {
        ScrollView{
            //HeaderView()
            //GraphView()
            SliderView1()
            
        
        
        }
       
    }
}

struct SliderTab_Previews: PreviewProvider {
    static var previews: some View {
        SliderTab()
    }
}

struct SliderView1 : View {
    @State var index = "All"
    @State var tab = 0
    @State private var isPressed: Bool = false
    @State var showIndicators1 = false
    @State var showIndicators2 = false
    @State var showIndicators3 = false
    @State var expandChart = false
    @State var data2: [String] = ["Aug", "Sept", "Oct", "Nov", "Dec", "Jan"]
    var body: some View{
        ScrollView{
        
            
            
            ScrollView {
                
                if expandChart{
                    HeaderView()
                    ChartTopView()
                    ReportsGraphView()
                        .onTapGesture {
                            self.expandChart.toggle()
                        }
                        .padding(.horizontal)
                       
                    AxisLabels(.horizontal, data: data2, id: \.self) {
                        Text("\($0)")
                            .fontWeight(.bold)
                            .font(Font.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 20)
                    .padding(.horizontal, 1)
                    .padding(.top, 35)
                }
                else{
                    HeaderView()
                    ReportsGraphView()
                        .onTapGesture {
                            self.expandChart.toggle()
                        }
                        .padding(.bottom, -80)
                        .padding(.horizontal)
                    AxisLabels(.horizontal, data: data2, id: \.self) {
                        Text("\($0)")
                            .fontWeight(.bold)
                            .font(Font.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 20)
                    .padding(.horizontal, 1)
                    .padding(.top, 140)
                    .padding(.bottom, -10)
                }
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                    
                        Text("Report")
                            .font(.custom("Roboto-Medium", size: 24)).foregroundColor(Color(#colorLiteral(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)))
                    }
                    .foregroundColor(.black)
                    
                    Spacer()

                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        // were going to create swipe menu by iteration...
                        
                        ForEach(menu1,id: \.self){i in
                            Button(action: {
                                        //self.isPressed.toggle()
                                        self.index = i
                                    }, label: {
                                        VStack {
                                            Text(i)
                                                .font(.custom("Roboto Regular", size: 18))
                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        }.neumorphic(isPressed: $isPressed, bgColor: (self.index == i ?
                                            Color(#colorLiteral(red: 0.20392157137393951, green: 0.8156862854957581, blue: 0.7215686440467834, alpha: 1)): Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1))))
                                    })
                                                    
                        }
                    }
                    .padding(.horizontal)
                }
                ScrollView{
                    //VStack{
                    
                    if index == "All"{
                        CardsShow()
                    }
                    if index == "Home Renovations"{
                        CardsShow(showIndicators1: true, showIndicators2: false, showIndicators3: false)
                    }
                    if index == "Economic Indicators"{
                        CardsShow(showIndicators1: false, showIndicators2: true, showIndicators3: false)
                    }
                    if index == "Neighbourhood Development"{
                        CardsShow(showIndicators1: false, showIndicators2: false, showIndicators3: true)
                    }
                }


            }
            //.frame(width: .infinity, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
           // .padding(.top, -60)
            }
        }
    
}

// menu buttons....

var menu1 = ["All","Home Renovations","Economic Indicators", "Neighbourhood Development"]
struct Neumorphic: ViewModifier {
    var bgColor: Color
    @Binding var isPressed: Bool

    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 100)
                        .fill(bgColor)
                        //.frame(width: 168, height: 35)
                }
            )
            .scaleEffect(self.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}

extension View {
    func neumorphic(isPressed: Binding<Bool>, bgColor: Color) -> some View {
        self.modifier(Neumorphic(bgColor: bgColor, isPressed: isPressed))
    }
}
