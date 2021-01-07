//
//  MainReportsView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 30/12/2020.
//

import SwiftUI

struct MainReportsView: View {
    
    @State var detail = false
    // intialization.....
    @State var detailData : Watch = data[0]
    
    var body: some View {
        
        ZStack{
            
            Detail(detailData: self.$detailData, detail: self.$detail)
                
                // expanding view when ever detail view is tapped...
                .frame(width: self.detail ? nil : 100, height: self.detail ? nil : 100)
                .opacity(self.detail ? 1 : 0)
            
            // hiding main view when detail view is visible...
            
            Home(detailData: self.$detailData, detail: self.$detail)
                .opacity(self.detail ? 0 : 1)
            
        }
        .animation(.default)
        // for changing status bar color...
        .preferredColorScheme(self.detail ? .dark : .light)
    }
}

struct MainReportsView_Previews: PreviewProvider {
    static var previews: some View {
        MainReportsView()
    }
}

struct Home : View {
    
    @State var index = "ALL"
    @State var tab = 0
    @Binding var detailData : Watch
    @Binding var detail : Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View{
        
        ZStack{
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                    
                        Text("Report")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()

                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        // were going to create swipe menu by iteration...
                        
                        ForEach(menu,id: \.self){i in
                            
                            Button(action: {
                                
                                self.index = i
                                
                            }) {
                                ZStack {
                                //All
                                    Text(i).font(.custom("Roboto Regular", size: 16))
                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))

                                //Rectangle 36
                                    RoundedRectangle(cornerRadius: 100)
                                    .fill(self.index == i ?
                                        Color(#colorLiteral(red: 0.20392157137393951, green: 0.8156862854957581, blue: 0.7215686440467834, alpha: 1)): Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                                    .frame(width: 87, height: 35)
                                }
                                /*
                                Text(i)
                                    .foregroundColor(self.index == i ? Color("Color1") : Color.black.opacity(0.6))
                                    .fontWeight(.bold)  */
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        ForEach(data,id: \.self){i in
                            
                            ZStack(alignment: .bottom) {
                                
                                Color("Color")
                                    .frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)
                                
                                VStack(spacing: 20){
                                    
                                    Image(i.image)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width / 1.7)
                                        .onTapGesture {
                                            
                                            // assigning data when ever image is tapped....
                                            self.detailData = i
                                            self.detail.toggle()
                                    }
                                    ZStack {
                                    //Oval
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                            Circle()
                                            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                        }
                                        .frame(width: 49.1, height: 49.1)
                                        .rotationEffect(.degrees(-20))

                                    //Oval
                                        Circle()
                                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .frame(width: 49.1, height: 49.1)

                                    //Last Visited 12/28/2020
                                        Text("Last Visited 12/28/2020").font(.custom("Roboto Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))

                                    //Ellipse 17
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))

                                            Image(systemName: "task")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 36, height: 36)
                                            .clipShape(Circle())

                                            Circle()
                                            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 2)
                                        }
                                        .frame(width: 36, height: 36)

                                    //Ellipse 16
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))

                                            Image(systemName: "task")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 36, height: 36)
                                            .clipShape(Circle())

                                            Circle()
                                            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 2)
                                        }
                                        .frame(width: 36, height: 36)

                                    //Ellipse 15
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))

                                            Image(systemName: "task")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 36, height: 36)
                                            .clipShape(Circle())

                                            Circle()
                                            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 2)
                                        }
                                        .frame(width: 36, height: 36)

                                    //Ellipse 14
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))

                                            Image(systemName: "task")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 36, height: 36)
                                            .clipShape(Circle())

                                            Circle()
                                            .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 2)
                                        }
                                        .frame(width: 36, height: 36)

                                    //12 Updates
                                        Text("12 Updates").font(.custom("Roboto Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))

                                    //Home Renovations
                                        Text("Home Renovations").font(.custom("Roboto Medium", size: 16))

                                    //Rectangle
                                        RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(#colorLiteral(red: 0.3657986521720886, green: 0.8958333134651184, blue: 0.8142894506454468, alpha: 0.36000001430511475)))
                                        .frame(width: 357, height: 133)
                                    }
                                   /* HStack{
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(i.title)
                                            
                                            Text("Apple Watch")
                                                .fontWeight(.bold)
                                                .font(.title)
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            
                                        }) {
                                            
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color("Color1"))
                                                .clipShape(Circle())
                                        }
                                    }  */
                                }
                                .padding(.horizontal)
                                .padding(.bottom)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 25)
                }
                
                HStack{
                    
                    Button(action: {
                        
                        self.tab = 0
                        
                    }) {
                        
                        Image(systemName: "suit.heart.fill")
                            .font(.title)
                            .foregroundColor(self.tab == 0 ? .black : Color.black.opacity(0.25))
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.tab = 1
                        
                    }) {
                        
                        Image(systemName: "safari")
                            .font(.title)
                             .foregroundColor(self.tab == 1 ? .black : Color.black.opacity(0.25))
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.tab = 2
                        
                    }) {
                        
                        Image(systemName: "person.circle")
                            .font(.title)
                            .foregroundColor(self.tab == 2 ? .black : Color.black.opacity(0.25))
                        
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top,25)
                // for no safearea phones padding will be 15 at bottom...
                .padding(.bottom, self.bottom! == 0 ? 15 : self.bottom! + 10)
                .background(Color.white)
                .clipShape(CShape())
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}

// Detail View...

struct Detail : View {
    
    @State var txt = ""
    //sample for designing ...
    @Binding var detailData : Watch
    @Binding var detail : Bool
    @State var index = 0
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View{
        
        ZStack{
            
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack(spacing: 15){
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Want to search anything", text: self.$txt)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(self.detailData.title)
                        
                        Text("Apple Watch Series 5")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Color")
                            .foregroundColor(Color.white.opacity(0.6))
                        
                        Text(self.detailData.color)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Price")
                            .foregroundColor(Color.white.opacity(0.6))
                            .padding(.top)
                        
                        Text(self.detailData.price)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    // due to bottom padding...
                    .offset(y: -50)
                    
                    Spacer(minLength: 0)
                    
                    Image(self.detailData.image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5)
                        .rotationEffect(.init(degrees: 10))
                }
                .padding(.horizontal)
                .padding(.bottom, -60)
                .zIndex(5)
                
                // zindex sets views postion on the stack...
                // moving bottom view up...
                
                ZStack(alignment: .topLeading){
                    
                    VStack{
                        
                        // for phones having lesser screen size...
                        
                        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                            
                            VStack{
                                
                                HStack(spacing: 0){
                                    
                                    Button(action: {
                                        
                                        self.index = 0
                                        
                                    }) {
                                        
                                        Text("Details")
                                            .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 0 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        
                                        self.index = 1
                                        
                                    }) {
                                        
                                        Text("Description")
                                            .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 1 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                }

                                
                                if self.index == 0{
                                    
                                    HStack(spacing: 20){
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("15mm")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip Width")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("Leather")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip material")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("50mm")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Water resist")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                    }
                                    .padding(.top)
                                }
                                else{
                                    
                                    Text("The Apple Watch Series 5 features a new always-on display, built-in compass for advanced navigation features, and a titanium case option.")
                                        .foregroundColor(.black)
                                        .padding(.top)
                                }

                                
                            }
                            .padding(.horizontal, 25)
                        }
                        // due to bottom padding -50
                        .padding(.top, 50)
                        
                        HStack{
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width / 1.5)
                                    .background(Color("Color1"))
                                    .cornerRadius(10)
                                
                            }
                            .shadow(radius: 5)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                                // closing the detail view when close button is pressed...
                                self.detail.toggle()
                                
                            }) {
                                
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top,10)
                        .padding(.horizontal, 25)
                        .padding(.bottom,self.bottom! == 0 ? 15 : self.bottom)
                    }
                    .background(Color.white)
                    .clipShape(CShape())
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Color1"))
                        .clipShape(Circle())
                    }
                    .padding(.leading, 50)
                    .offset(y: -35)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


// menu buttons....

var menu = ["All","Home Renovations","Economic Indicators"]


// sample watch data....

struct Watch : Identifiable,Hashable{
    
    var id : Int
    var color : String
    var price : String
    var image : String
    var title : String
}

var data = [

    Watch(id: 0, color: "Dark Black", price: "$500", image: "black",title: "Classic Black"),
    Watch(id: 1, color: "Light Yellow", price: "$450", image: "yellow",title: "Classic Yellow"),
    Watch(id: 2, color: "Rose Gold", price: "$510", image: "gold",title: "Classic Gold"),
    Watch(id: 3, color: "Red", price: "$500", image: "red",title: "Classic Red"),
    Watch(id: 4, color: "White", price: "$400", image: "white",title: "Classic White"),
]
