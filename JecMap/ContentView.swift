//
//  ContentView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/06.
//

import SwiftUI
import MapKit
struct ContentView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69857244753979, longitude: 139.6981410560849), latitudinalMeters: 100, longitudinalMeters: 100)
    
    @State var goal = (Destination: "本館",latitude: 35.69857244753979, longitude: 139.6981410560849)
    
//    let tpl: (Destination: String, latitude: Double, longitude: Double)
    
    @State var isAc:Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(region: $region)
                    .ignoresSafeArea(.all)
                VStack {
                    NavigationLink(destination: NaviView(goal: goal), isActive:  $isAc) {
                                            EmptyView()
                    }
                    
                    Spacer()
                    LocationView(pin: $region, isNavi: $isAc, goal: $goal)
                        .frame(width: UIScreen.main.bounds.width, height: 200.0)
                }
            }
            .onAppear(){
                print(region.center.longitude)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
