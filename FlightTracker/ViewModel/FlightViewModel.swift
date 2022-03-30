//
//  FlightViewModel.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 13/03/2022.
//

import Foundation
import SwiftUI

class FlightViewModel : ObservableObject{
    
    private var service = FlightService()
    
    var flight = FlightModel(data: [])
    
    
    @Published var info : Info
    @Published var departure : DepartureInfo
    @Published var arrival : ArrivalInfo
    @Published var airline : AirlineInfo
    
    @Published var loading : Bool = false
    
    
    
    init(){
        self.info = Info(status: "", icon: "", color: Color.red, date: "")
        self.departure = DepartureInfo(airport: "", terminal: "", scheduled: "", actual: "")
        self.arrival = ArrivalInfo(airport: "", terminal: "", scheduled: "", actual: "")
        self.airline = AirlineInfo(airline: "", flightNumber: "", flightSeries: "")
    }
    
    

    func searchTheFlight(iata : String){
        fetchData(by: iata)
        loading = true
    }
    
    
    private func fetchData(by iata: String){
        
        self.service.getFlight(iata: iata) { flight in
            if let flight = flight {
                DispatchQueue.main.async {
                    self.flight = flight
                    print(self.flight)
                    print(flight.data.count)
                    if flight.data.count > 0{
                        self.updateData()
                        self.loading = false
                    }
                  
                }
                
            }
        }
    }
    
    
    private func updateData(){
        
        info.status = flight.data[0].flight_status.firstUppercased
        info.icon = getIcon.0
        info.color  = getIcon.1
        info.date = date
        
        
        departure.airport = flight.data[0].departure.airport
        departure.terminal  = flight.data[0].departure.terminal
        departure.scheduled =  fixedDepartureScheduled
        departure.actual = fixedDepartureActual
        
        
        arrival.airport = flight.data[0].arrival.airport
        arrival.terminal = flight.data[0].arrival.terminal
        arrival.scheduled = fixedArrivalScheduled
        arrival.actual = fixedArrivalActual
        
        
        airline.airline = flight.data[0].airline.name
        airline.flightNumber = flight.data[0].flight.number
        airline.flightSeries = flightNumbers
        
    }
    
    
    
    
    var date : String{
        let date  = flight.data[0].flight_date
        let divide = date.split(separator: "-")
        let reverse = divide.reversed()
        return reverse.joined(separator: "-")
        
    }
    
    var flightNumbers : String{
        return "\(flight.data[0].flight.iata)/\(flight.data[0].flight.icao)"
    }
    
    var fixedDepartureScheduled : String{
        let hour = flight.data[0].departure.scheduled
        let divide = hour.split(separator: "T")
        let exactHour = divide[1].split(separator: "+")
        let hourString = String(exactHour[0])
        return hourString
        
    }
    
    var fixedDepartureActual : String{
        let hour = flight.data[0].departure.actual
        let divide = hour.split(separator: "T")
        let exactHour = divide[1].split(separator: "+")
        let hourString = String(exactHour[0])
        return hourString
        
    }
    
    var fixedArrivalScheduled : String{
        let hour = flight.data[0].arrival.scheduled
        let divide = hour.split(separator: "T")
        let exactHour = divide[1].split(separator: "+")
        let hourString = String(exactHour[0])
        return hourString
    }
    
    var fixedArrivalActual : String{
        if let hour = flight.data[0].arrival.actual{
            let divide = hour.split(separator: "T")
            let exactHour = divide[1].split(separator: "+")
            let hourString = String(exactHour[0])
            return hourString
        } else {
            return "-"
        }
    }
    
    var getIcon : (String, Color){
        
        switch flight.data[0].flight_status{
        case "scheduled" : return ("calendar.circle.fill" , Color.yellow)
        case "active" : return ("airplane.circle.fill" , Color.blue)
        case "landed" : return ("checkmark.circle.fill" , Color.green)
        case "cancelled" : return ("xmark.circle.fill" , Color.red)
        case "incident" : return ("exclamationmark.circle.fill" , Color.orange)
        case "diverted" : return ("arrow.up.arrow.down.circle.fill" , Color.orange)
        default:
            return ("airplane.circle.fill" , Color.blue)
        }
    }
    
    
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}





