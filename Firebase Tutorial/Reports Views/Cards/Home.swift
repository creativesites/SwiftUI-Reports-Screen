//
//  Home.swift
//  Firebase Tutorial
//
//  Created by Kavsoft on 05/01/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI

struct Home22 : View {
    
    @EnvironmentObject var economics : getCardsData
    
    //var data : cardData
    var body : some View{
                    
            if self.economics.datas.count != 0{
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20){

                                            
                        ForEach(self.economics.datas){i in
                            
                            CellView(data: i)
                    
                    }.padding()
                    }
                    .padding(.horizontal, 20)
                    
                }.background(Color("Color").edgesIgnoringSafeArea(.all))
            }
            
            else{
                
                Loader()
            }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home22()
    }
}
