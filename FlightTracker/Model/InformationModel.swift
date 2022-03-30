//
//  InformationModel.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 23/03/2022.
//

import Foundation



struct Info{
    
    var status : String
    var icon : String
    var color : Color
    var date : String
    
}


struct DepartureInfo {
    
    var airport : String
    var terminal : String
    var scheduled : String
    var actual : String
    
}

struct ArrivalInfo{
    
    var airport : String
    var terminal : String
    var scheduled : String
    var actual : String
    
}

struct AirlineInfo{
    
    var airline : String
    var flightNumber : String
    var flightSeries : String
    
}
