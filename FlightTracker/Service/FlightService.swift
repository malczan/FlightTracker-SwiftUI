//
//  FlightService.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 12/03/2022.
//

import Foundation
import SwiftUI


class FlightService{
    
    func getFlight(iata : String, completion: @escaping(FlightModel?) -> ()){
        
        guard let url = URL(string:"http://api.aviationstack.com/v1/flights?access_key={YOUR_API_KEY}=\(iata)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return
                
            }
            
            let flightData = try? JSONDecoder().decode(FlightModel.self, from: data)
            if let flightData = flightData{
                let flight = flightData
                completion(flight)
                
            }
        }
        .resume()
        
    }
    
}

