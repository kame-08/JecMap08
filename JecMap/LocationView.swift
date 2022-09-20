//
//  LocationView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/06.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @State var selection = 1
    @Binding var pin :MKCoordinateRegion
    
    @Binding var isNavi: Bool
    
    @State var Meters: CLLocationDistance = 100
    
    @Binding var goal: (Destination: String,latitude: Double, longitude: Double)
    
    var body: some View {
        VStack{
            Spacer()
            TabView(selection: $selection) {
                hoge(title: "本館", isNavi: $isNavi)
                    .tag(1)
                
                ForEach(2..<13) { i in
                    hoge(title: "\(i)号館", isNavi: $isNavi)
                        .tag(i)
                }
            }
            //            .tabViewStyle(.page)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.onChange(of: selection) { newValue in
            //本館
            if newValue == 1 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69857244753979, longitude: 139.6981410560849), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 2 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6989985881511, longitude: 139.69796247142756), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 3 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69868166322867, longitude: 139.69839971375617), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 4 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.698926436943914, longitude: 139.69819260026327), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 5 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6990939365779, longitude: 139.69743022724919), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 6 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69842508965526, longitude: 139.69796247142745), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 7 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69894094701618, longitude: 139.69653272724912), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 8 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69761045281154, longitude: 139.69779081005694), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 9 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69938827675634, longitude: 139.69801154259176), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 10 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69955123784045, longitude: 139.6979809137563), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 11 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.70089900147449, longitude: 139.69795110478069), latitudinalMeters: Meters, longitudinalMeters: Meters)
            } else if newValue == 12 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.69554665009267, longitude: 139.69899678492044), latitudinalMeters: Meters, longitudinalMeters: Meters)
            }
            
            
            goal = (Destination: "\(newValue)号館",latitude: pin.center.latitude, longitude: pin.center.longitude)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(pin: .constant(MKCoordinateRegion()), isNavi: .constant(false), goal: .constant((Destination: "本館", latitude: 35.69857244753979, longitude: 139.6981410560849)))
    }
}

struct hoge: View {
    @State var title: String
    @Binding var isNavi: Bool
    
    var body: some View {
        
        HStack(alignment: .top) {
            Image(title)
                .resizable()
            //.aspectRatio(contentMode: .fit)
                .scaledToFill()
                .frame(width: 100.0, height: 100.0)
                .cornerRadius(10)
            
            Text("\(title)")
                .font(.title)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isNavi = true
                    } label: {
                        Text("出発")
                    }.buttonStyle(.borderedProminent)
                }
            }
            Spacer()
            
        }
        .padding(.all)
        .background(.bar)
        .cornerRadius(10)
        .padding(.all)
    }
}
