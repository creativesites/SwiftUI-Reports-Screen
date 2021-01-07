//
//  Cards.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 31/12/2020.
//

import SwiftUI

struct CardsShow: View {
    @State var showIndicators1 = false
    @State var showIndicators2 = false
    @State var showIndicators3 = false
    @EnvironmentObject var economics : getCardsData
    @ObservedObject var comms: getCommunityData = getCommunityData()
    var body: some View {
        //ScrollView{
        VStack{
            Button(action: { self.showIndicators1.toggle() }) {
                if showIndicators1{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack {
                                            Text("Home Renovations").font(.custom("Roboto Medium", size: 18))
                                                .foregroundColor(.primary)
                                            //Last Visited 12/28/2020
                                            Text("Last Visited 12/28/2020").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                .padding(.bottom, 20)
                                        }
                                        .padding(.top, 20)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(360))
                                               
                                        }
                                        .background(
                                            ZStack {
                                            //Oval
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [60,1000000000]))
                                                }
                                                .frame(width: 50, height: 50)
                                                .rotationEffect(.degrees(70.14))

                                            //Oval
                                                Circle()
                                                .fill(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                                                .frame(width: 50, height: 50)
                                                .rotationEffect(.degrees(90.14))
                                            }

                                        )
                                        
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    
                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.3657986521720886, green: 0.8958333134651184, blue: 0.8142894506454468, alpha: 0.36000001430511475)))
                            .frame(width: 357, height: 83)
                        }
                    )
                }
                else{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack {
                                            Text("Home Renovations").font(.custom("Roboto Medium", size: 18))
                                                .foregroundColor(.primary)
                                            //Last Visited 12/28/2020
                                            
                                            Text("Last Updated 01/07/2021)").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                .padding(.bottom, 20)
                                        }
                                        .padding(.top, 40)
                                        Spacer()
                                        Text("\(self.economics.datas.count) Updates").font(.custom("Roboto Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    HStack {
                                        HStack {
                                            VStack{
                                                Image("a")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))

                                            )
                                            
                                            VStack{
                                                Image("b")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -25, y: 0)
                                                                                        //Oval
                                            VStack{
                                                Image("c")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -50, y: 0)
                                            VStack{
                                                Image("e")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -75, y: 0)
                                            
                                        }
                                        .padding(.bottom, 30)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.266988337, green: 0.813996017, blue: 0.7198500633, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(90))
                                        }
                                        .padding(.bottom, 1)
                                        .padding(.leading, 5)
                                        .background(
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .frame(width: 50, height: 50)
                                            //.rotationEffect(.degrees(90.14))
                                        })
                                        .padding(.bottom, 30)
                                    }
                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.3657986521720886, green: 0.8958333134651184, blue: 0.8142894506454468, alpha: 0.36000001430511475)))
                            .frame(width: 357, height: 133)
                        }
                    )
                }
            
            }
            if showIndicators1{
                Home22()
                    .padding(.top, -20)
                    .padding(.bottom, 20)
            }
            Button(action: { self.showIndicators2.toggle() }) {
                if showIndicators2{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack {
                                            Text("Economic Indicators").font(.custom("Roboto Medium", size: 18))
                                                .foregroundColor(.primary)
                                            //Last Visited 12/28/2020
                                            
                                            Text("Last Updated 01/07/2021").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                .padding(.bottom, 20)
                                        }
                                        .padding(.top, 20)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.4752776027, green: 0.6848737597, blue: 0.9985286593, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(360))                                        }
                                        .background(
                                            ZStack {
                                            
                                            //Oval
                                                Circle()
                                                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                                .frame(width: 50, height: 50)
                                                .rotationEffect(.degrees(90.14))
                                            }

                                        )
                                        
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    
                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.3164583444595337, green: 0.5515415668487549, blue: 0.9041666388511658, alpha: 0.20000000298023224)))
                            .frame(width: 357, height: 83)
                        }
                    )
                }
                else{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack {
                                            Text("Economic Indicators").font(.custom("Roboto Medium", size: 18))
                                                .foregroundColor(.primary)
                                            //Last Visited 12/28/2020
                                            
                                            Text("Last Updated 01/07/2021").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                .padding(.bottom, 20)
                                        }
                                        .padding(.top, 40)
                                        Spacer()
                                        Text("\(self.economics.datas.count) Updates").font(.custom("Roboto Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    HStack {
                                        HStack {
                                            VStack{
                                                Image("a")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))

                                            )
                                            
                                            VStack{
                                                Image("b")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -25, y: 0)
                                                                                        //Oval
                                            VStack{
                                                Image("c")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -50, y: 0)
                                            VStack{
                                                Image("e")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -75, y: 0)
                                            
                                        }
                                        .padding(.bottom, 30)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.4752776027, green: 0.6848737597, blue: 0.9985286593, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(90))
                                        }
                                        //.padding(.bottom, 1)
                                        //.padding(.leading, 5)
                                        .background(
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .frame(width: 50, height: 50)
                                            //.rotationEffect(.degrees(90.14))
                                        })
                                        .padding(.bottom, 30)
                                    }                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.3164583444595337, green: 0.5515415668487549, blue: 0.9041666388511658, alpha: 0.20000000298023224)))
                            .frame(width: 357, height: 133)
                        }
                    )
                }
            
            }
            .padding(.top, -50)
            if showIndicators2{
                Home22()
                        .padding(.top, -20)
                        .padding(.bottom, 20)
                
            }
            Button(action: { self.showIndicators3.toggle() }) {
                if showIndicators3{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack {
                                            Text("Neighbourhood Development").font(.custom("Roboto-Medium", size: 18))
                                                .foregroundColor(.primary)
                                                .padding(.bottom, 2)
                                            //Last Visited 12/28/2020
                                            
                                            Text("Last Updated 01/07/2021").font(.custom("Roboto-Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                .padding(.bottom, 20)
                                        }
                                        .padding(.top, 20)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.9765821099, green: 0.7748613954, blue: 0.3606334925, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(360))
                                        }
                                        .background(
                                            ZStack {
                                            

                                            //Oval
                                                Circle()
                                                .fill(Color(#colorLiteral(red: 0.9624999761581421, green: 0.9624999761581421, blue: 0.9624999761581421, alpha: 1)))
                                                .frame(width: 50, height: 50)
                                                .rotationEffect(.degrees(90.14))
                                            }

                                        )
                                        
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    
                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.9041666388511658, green: 0.7396082878112793, blue: 0.3164583444595337, alpha: 0.20000000298023224)))
                            .frame(width: 357, height: 83)
                        }
                    )
                }
                else{
                    VStack{
                        VStack{
                            //Home Renovations
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        VStack (alignment: .leading){
                                            Text("Neighbourhood Development").font(.custom("Roboto-Medium", size: 18))
                                                .foregroundColor(.primary)
                                                .padding(.bottom, 2)
                                            //Last Visited 12/28/2020
                                            
                                            Text("Last Updated 01/07/2021").font(.custom("Roboto-Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)))
                                                //.padding(.bottom, 20)
                                        }
                                        .padding(.top, 40)
                                        Spacer()
                                        Text("\(self.comms.comdatas.count) Updates").font(.custom("Roboto-Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)))
                                            //.padding()
                                        
                                    }
                                    //Oval
                                    HStack {
                                        HStack {
                                            VStack{
                                                Image("a")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))

                                            )
                                            
                                            VStack{
                                                Image("b")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -25, y: 0)
                                                                                        //Oval
                                            VStack{
                                                Image("c")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -50, y: 0)
                                            VStack{
                                                Image("e")
                                                    .resizable()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                    .frame(width: 30, height: 30)
                                            }
                                            .background(
                                                ZStack {
                                                    Circle()
                                                    .fill(Color(#colorLiteral(red: 0.847000002861023, green: 0.847000002861023, blue: 0.847000002861023, alpha: 1)))

                                                    Circle()
                                                    .strokeBorder(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [88,1000000000]))
                                                }
                                                .frame(width: 39.1, height: 39.1)
                                                .rotationEffect(.degrees(-20))
                                                //.offset(x: -25, y: 0)

                                            )
                                            .offset(x: -75, y: 0)
                                            
                                        }
                                        .padding(.bottom, 30)
                                        Spacer()
                                        VStack{
                                            Image(systemName: "triangle.fill").resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(#colorLiteral(red: 0.9765821099, green: 0.7748613954, blue: 0.3606334925, alpha: 1)))
                                                .rotationEffect(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .rotationEffect(.degrees(90))
                                        }
                                        .padding(.bottom, 1)
                                        .padding(.leading, 5)
                                        .background(
                                        ZStack {
                                            Circle()
                                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .frame(width: 50, height: 50)
                                            //.rotationEffect(.degrees(90.14))
                                        })
                                        .padding(.bottom, 30)
                                    }
                                }
                                .padding()
                            }
                            .padding(.horizontal, 30)
                            //Spacer()
                        }
                    }
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.9041666388511658, green: 0.7396082878112793, blue: 0.3164583444595337, alpha: 0.20000000298023224)))
                            .frame(width: 357, height: 133)
                        }
                    )
                }
            
            }
            .padding(.top, -50)
            if showIndicators3{
                CommunityCardsView()
                        .padding(.top, -40)
                        .padding(.bottom, 60)
                
            }
        }
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        CardsShow()
    }
}
