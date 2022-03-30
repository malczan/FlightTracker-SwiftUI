//
//  FlightModel.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 12/03/2022.
//

import Foundation


struct FlightModel : Codable{
    var data : [Data]
}

struct Data : Codable{
    var flight_date : String
    var flight_status : String
    var departure : Departure
    var arrival : Arrival
    var airline : Airline
    var flight : Flight
}


struct Departure : Codable{
    var airport : String
    var terminal : String
    var scheduled : String
    var actual : String
    
    
}

struct Arrival : Codable{
    var airport : String
    var terminal : String
    var scheduled : String
    var actual : String?

}

struct Airline : Codable{
    var name : String
}

struct Flight : Codable{
    var number : String
    var iata : String
    var icao : String
}

