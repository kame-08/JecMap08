//
//  ContentView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/06.
//

import SwiftUI
import MapKit
struct ContentView: View {
    
    @State var pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.698785, longitude: 139.696548), latitudinalMeters: 300, longitudinalMeters: 300)
    
    var body: some View {
        ZStack {
            MapView(region: pin)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                LocationView(pin: $pin)
                    .frame(width: UIScreen.main.bounds.width, height: 200.0)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
