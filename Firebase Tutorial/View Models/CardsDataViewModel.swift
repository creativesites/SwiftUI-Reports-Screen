//
//  CardsDataViewModel.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import SwiftUI
import Firebase

class getCardsData : ObservableObject{
    
    @Published var datas = [cardData]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("Economics/Country/EconomicIndicator").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let area = i.document.get("area") as! String
                let categoryIndicator = i.document.get("indicator") as! String
                let city = i.document.get("city") as! String
                let dataSource = i.document.get("dataSource") as! String
                let description = i.document.get("description") as! String
                let PropziImpact = i.document.get("propziImpact") as! String
                
                self.datas.append(cardData(id: id, area: area, categoryIndicator: categoryIndicator, city: city, dataSource: dataSource, description: description, PropziImpact: PropziImpact))
            }
        }
    }
}

class getCommunityData : ObservableObject{
    
    @Published var comdatas = [neighbourhoodDevelopmentData]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("Community/Ajax/Carruthers Creek").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let community = i.document.get("community") as! String
                let category = i.document.get("category") as! String
                let city = i.document.get("city") as! String
                let createdDate = i.document.get("createdDate") as! String
                let dataSource = i.document.get("dataSource") as! String
                let heading = i.document.get("heading") as! String
                let description = i.document.get("description") as! String
                let PropziImpact = i.document.get("propziImpact") as! String
                
                self.comdatas.append(neighbourhoodDevelopmentData(id: id, category: category, heading: heading, community: community, createdDate: createdDate, city: city, dataSource: dataSource, description: description, PropziImpact: PropziImpact ))
            }
        }
    }
}

