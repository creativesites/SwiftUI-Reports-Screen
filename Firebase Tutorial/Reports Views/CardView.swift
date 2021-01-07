//
//  CardView.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 30/12/2020.
//
import SwiftUI

struct CardView : View {
    
    @State var index = 0
    @State var stories = [
        
        Story(id: 0, image: "c", offset: 0,title: "Employment Rate Decreased", desc: "Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month.", PropziImpact: "-$17", area: "Peel", source: "Peel Bank Data"),
        Story(id: 1, image: "b", offset: 0,title: "Canada Confidence Index", desc: "Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month.", PropziImpact: "-$17", area: "Peel", source: "Peel Bank Data"),
        Story(id: 2, image: "c", offset: 0,title: "Canada MLS Benchmark Price", desc: "Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month.", PropziImpact: "-$17", area: "Peel", source: "Peel Bank Data"),
        Story(id: 3, image: "f", offset: 0,title: "Canadian Dollar Value in USD", desc: "Unemployment has increased in the Peel region, from 11.3% to 11.7% vs last month.", PropziImpact: "-$17", area: "Peel", source: "Peel Bank Data"),
]
    @State var scrolled = 0
    @State var index1 = 0
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                // Card View....
                
                ZStack{
                    
                    // Zstack Will Overlap Views So Last WIll Become First...
                    
                    ForEach(stories.reversed()){story in
                        
                        HStack{
                            
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                                                                    
                                Image(story.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        // dynamic frame....
                                        // dynamic height...
                                        .frame(width: calculateWidth(), height: (UIScreen.main.bounds.height / 2.4) - CGFloat(story.id - scrolled) * 50)
                                        .cornerRadius(15)
                                    // based on scrolled changing view size...
                                if story.id == scrolled {
                                    HStack {
                                        VStack{
                                            //STructure & Exteriors
                                            Text("Structure & Exteriors").font(.custom("Abel Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                        }
                                        .background(
                                            ZStack{
                                                //Rectangle 12
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                                                .frame(width: 121, height: 21)
                                            }
                                        )
                                        .offset(x: calculateWidth() - 220, y: -340)
                                        
                                        //.hidden()

                                        //.offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : calculateWidth() - 180, y: -200)
                                        
                                    }
                                    .frame(width: calculateWidth() - 40)

                                
                                }
                                else{
                                    HStack {
                                        VStack{
                                            //STructure & Exteriors
                                            Text("Structure & Exteriors").font(.custom("Abel Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                        }
                                        .background(
                                            ZStack{
                                                //Rectangle 12
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(#colorLiteral(red: 0.27450984716415405, green: 0.8156862854957581, blue: 0.7137255668640137, alpha: 0.25)))
                                                .frame(width: 111, height: 21)
                                            }
                                        )
                                        .offset(x: calculateWidth() - 180, y: -200)
                                        
                                        //.hidden()

                                        //.offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : calculateWidth() - 180, y: -200)
                                        
                                    }
                                    .frame(width: calculateWidth() - 40)
                                    .hidden()

                                }
                                VStack(alignment: .leading,spacing: 18){
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading) {
                                            Text(story.title)
                                                //.font(.title)
                                                .font(.custom("Roboto-Regular", size: 14))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1)))
                                                //.padding()
                                            Text("from").font(.custom("Roboto Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1) + Text(story.source).font(.custom("Roboto Medium", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.13, blue: 0.13, alpha: 1))).tracking(1)
                                                //.padding(.bottom, 6)
                                            Text(story.desc)
                                                .font(.custom("Roboto-Light", size: 14))
                                                .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.51, blue: 0.56, alpha: 1))).tracking(1)
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(5)
                                                .allowsTightening(true)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .padding(.top, 5)
                                        }
                                        Spacer()
                                    }
                                    
                                    Button(action: {}) {
                                        
                                        HStack {
                                            Text("Propzi Impact:")
                                                .font(.caption)
                                                .font(.custom("Roboto Regular", size: 13)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                                
                                            Text(story.PropziImpact)
                                                .font(.custom("Roboto Regular", size: 13))
                                                .foregroundColor(Color(#colorLiteral(red: 0.59, green: 0.01, blue: 0.01, alpha: 1)))
                                                                                        
                                        }
                                        .padding(.vertical,6)
                                        .padding(.horizontal,25)
                                        .background(Color(.white))
                                        .clipShape(Capsule())
                                    }
                                }
                                .background(
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                                        .frame(width: calculateWidth(), height: 188)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07999999821186066)), radius:48, x:0, y:2)
                                    }
                                )
                                .frame(width: calculateWidth() - 40)
                                .padding(.leading,20)
                                .padding(.bottom,20)
                                

                            }
                            .offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled) * 30 : 60)
                            
                            Spacer(minLength: 0)
                        }
                        .contentShape(Rectangle())
                        // adding gesture...
                        .offset(x: story.offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation{
                                
                                // disabling drag for last card...
                                
                                if value.translation.width < 0 && story.id != stories.last!.id{
                                    
                                    stories[story.id].offset = value.translation.width
                                }
                                else{
                                    
                                    // restoring cards...
                                    
                                    if story.id > 0{
                                        
                                        stories[story.id - 1].offset = -(calculateWidth() + 60) + value.translation.width
                                    }
                                }
                                
                                
                            }
                            
                        }).onEnded({ (value) in
                            
                            withAnimation{
                            
                                if value.translation.width < 0{
                                    
                                    if -value.translation.width > 180 && story.id != stories.last!.id{
                                        
                                        // moving view away...
                                        
                                        stories[story.id].offset = -(calculateWidth() + 60)
                                        scrolled += 1
                                    }
                                    else{
                                        
                                        stories[story.id].offset = 0
                                    }
                                }
                                else{
                                    
                                    // restoring card...
                                    
                                    if story.id > 0{
                                        
                                        if value.translation.width > 180{
                                            
                                            stories[story.id - 1].offset = 0
                                            scrolled -= 1
                                        }
                                        else{
                                            
                                            stories[story.id - 1].offset = -(calculateWidth() + 60)
                                        }
                                    }
                                }
                            }
                            
                        }))
                    }
                }
                // max height...
                //.frame(height: UIScreen.main.bounds.height / 1.8)
                
                .padding(.horizontal,25)
                .padding(.top,25)
                
                
            }
        }
        .background(Color.white)
        /*.background(
        
            LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        ) */
    }
    
    func calculateWidth()->CGFloat{
        
        // horizontal padding 50
        
        let screen = UIScreen.main.bounds.width - 50
        
        // going to show first three cards
        // all other will be hidden....
        
        // scnd and third will be moved x axis with 30 value..
        
        let width = screen - (2 * 30)
        
        return width
    }
}


// Sample Data....

struct Story : Identifiable {
    var id: Int
    //var id : Int
    var image : String
    var offset : CGFloat
    var title : String
    var desc: String
    //var category: String
    var PropziImpact: String
    var area: String
    var source: String
}


struct  CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
