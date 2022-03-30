//
//  ContentView.swift
//  FlightTracker
//
//  Created by Jakub Malczyk on 12/03/2022.
//

import SwiftUI

struct SearchView: View {
    
    @State var flight = ""
 
    var flightVM = FlightViewModel()

    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [Color("Blue"),Color("LightBlue")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                    TextField("Search", text: $flight)
                            .padding(.leading, 10)
                        
                        Button(action: {
                        }, label: {
                            NavigationLink(destination: FlightView(flight: flight)) {
                                Image(systemName: "magnifyingglass")
                            }
                        })
                        
                        .padding(.trailing, 10)
                    }// HStack
                    .frame(width: 370, height: 50)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(300)
                    
                    
                    Text("""
                            Type a flight iata code-number to get
                            information about this flight. For example: U27652
                        """)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding(15)
                    
                    Spacer()
                        
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .foregroundColor(.white.opacity(0.65))
                        .rotationEffect(.degrees(-30))
                        
                    
                    Spacer()
                    
                    
                }
                .navigationTitle("Track your flight")
                .ignoresSafeArea(.keyboard)
                
                
            }// ZStack
            
          
        }// NavigationVIew
        
        
    }
}
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
