//
//  FlightView.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 12/03/2022.
//

import SwiftUI

struct FlightView: View {
    
    @State var status : Bool = true
    
    @ObservedObject var flightVM = FlightViewModel()
    
    var flight : String
    
    
    init(flight : String){
        self.flight = flight
        
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("Blue"),Color("LightBlue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                
                VStack(spacing:30){
                    HStack(spacing: 180){
                        Text(flightVM.info.status)
                            .font(.system(size: 30))
                            .foregroundColor(Color("DarkBlue"))
                        
                        Image(systemName: flightVM.info.icon)
                            .resizable()
                            .foregroundColor(flightVM.info.color)
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                        
                    }// : HStack
                    .padding(.top)
                    
                    Text(flightVM.info.date)
                        .font(.title)
                        .foregroundColor(Color("DarkBlue"))
                    
                    HStack(spacing: 80){
                        VStack(alignment: .leading){
                            Text("DEPARTURE:")
                                .tittleTextStyle()
                                .padding(.bottom, 10)
                            Text("AIRPORT")
                                .tittleTextStyle()
                            Text(flightVM.departure.airport)
                                .informationTextStyle()
                            Text("TERMINAL")
                                .tittleTextStyle()
                            Text(flightVM.departure.terminal)
                                .informationTextStyle()
                            Text("SCHEDULED")
                                .tittleTextStyle()
                            Text(flightVM.departure.scheduled)
                                .informationTextStyle()
                            Text("ACTUAL")
                                .tittleTextStyle()
                            Text(flightVM.departure.actual)
                                .informationTextStyle()
                            
                        }
                        VStack(alignment: .leading){
                            Text("ARRIVAL:")
                                .tittleTextStyle()
                                .padding(.bottom, 10)
                            Text("AIRPORT")
                                .tittleTextStyle()
                            Text(flightVM.arrival.airport)
                                .informationTextStyle()
                            Text("TERMINAL")
                                .tittleTextStyle()
                            Text(flightVM.arrival.terminal)
                                .informationTextStyle()
                            Text("SCHEDULED")
                                .tittleTextStyle()
                            Text(flightVM.arrival.scheduled)
                                .informationTextStyle()
                            Text("ACTUAL")
                                .tittleTextStyle()
                            Text(flightVM.arrival.actual)
                                .informationTextStyle()
                        }
                        
                    }// : HStack
                    Spacer()
                    
                    VStack{
                        Text("More information about flight")
                            .font(.title)
                            .foregroundColor(Color("DarkBlue"))
                            .padding(.bottom)
                        HStack{
                            Text("Airline")
                                .font(.title2)
                                .foregroundColor(Color("DarkBlue"))
                            Spacer()
                            Text(flightVM.airline.airline)
                                .informationTextStyle()
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Text("Number")
                                .font(.title2)
                                .foregroundColor(Color("DarkBlue"))
                            Spacer()
                            Text(flightVM.airline.flightNumber)
                                .informationTextStyle()
                        }
                        .padding(.horizontal)
                        HStack{
                            Text("Flight")
                                .font(.title2)
                                .foregroundColor(Color("DarkBlue"))
                            Spacer()
                            Text(flightVM.airline.flightSeries)
                                .informationTextStyle()
                        }
                        .padding(.horizontal)
                        
                    }.padding(.bottom)
                    
                    
                    
                }// : VStack
                .navigationTitle(flightVM.airline.flightSeries)
                
            }
            .frame(width: 390, height: 650)//: ZStack
            
            if flightVM.loading == true{
                
                ZStack{
                    LinearGradient(colors: [Color("Blue"),Color("LightBlue")], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(3)
                }
            }
            
        }// : ZStack
        .onAppear {
            flightVM.searchTheFlight(iata: flight)
            
            
        }
        
    }
}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView(flight: "U27652")
    }
}


extension Text{
    
    func tittleTextStyle() -> some View{
        self.font(.title3)
            .fontWeight(.medium)
            .foregroundColor(Color("DarkBlue"))
    }
    
    func informationTextStyle() -> some View{
        self.multilineTextAlignment(.leading)
            .foregroundColor(Color("Gray"))
    }
    
}
