//
//  MapView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/06.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
//    @State var pin: MKCoordinateRegion
    
    //現在地
    @State var region : MKCoordinateRegion
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode)
            
            VStack{
                Spacer()
                
                Text("\(region.center.latitude)")
                Text("\(region.center.longitude)")
            }
            
        }.onAppear(){
            //TODO: -GPS許可ここでいいのか？
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.698785, longitude: 139.696548), latitudinalMeters: 300, longitudinalMeters: 300))
    }
}
