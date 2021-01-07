//
//  CardsData.swift
//  propzi reports page
//
//  Created by Winston T Chikazhe on 06/01/2021.
//

import Foundation

struct cardData : Identifiable {
    var id: String
    var area : String
    var categoryIndicator : String
    var city : String
    var dataSource: String
    var description: String
    var PropziImpact: String
    //var months: [String]
}

struct neighbourhoodDevelopmentData : Identifiable {
    var id: String
    //var area : String
    var category : String
    var heading : String
    var community : String
    var createdDate : String
    var city : String
    var dataSource: String
    var description: String
    var PropziImpact: String
    //var months: [String]
}

struct schoolsData : Identifiable {
    var id: String
    var affiliationOrType : String
    var category : String
    var city : String
    var dataSource: String
    var description: String
    var districtBoard : String
    var grades : String
    var heading : String
    var language : String
    var municipality : String
    var schoolName : String
    var schoolPopulation : String
    var schoolRanking : String
    var score : String
    var yearReleased : String
    var PropziImpact: String
    //var months: [String]
}

