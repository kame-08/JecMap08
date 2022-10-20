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
    //現在地
    @Binding var region : MKCoordinateRegion
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode)
        }
        .task {
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(region: .constant (MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69857244753979, longitude: 139.6981410560849), latitudinalMeters: 100, longitudinalMeters: 100)))
    }
}
