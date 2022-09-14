//
//  NaviView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/13.
//

import SwiftUI
import MapKit

struct NaviView: View {
    
    @ObservedObject var viewModel = NaviViewModel()
    
    @State var Meters: CLLocationDistance = 20
    
     var goal: (Destination: String,latitude: Double, longitude: Double)
    
    //現在地
    @State var region = MKCoordinateRegion()
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        let latitude  = $region.center.latitude.wrappedValue
        let longitude = $region.center.longitude.wrappedValue
        //        NavigationView {
        VStack {
            HStack{
                //viewModel.
                Text(goal.Destination)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .padding(.horizontal)
                
                Spacer()
            }
            
            HStack {
                Button {
                    if viewModel.Transportation == "figure.walk" {
                        viewModel.Transportation = "bicycle"
                    }else if viewModel.Transportation == "bicycle" {
                        viewModel.Transportation = "car"
                    }else if viewModel.Transportation == "car" {
                        viewModel.Transportation = "figure.walk"
                    }
                } label: {
                    Image(systemName: "\(viewModel.Transportation)")
                    Text(viewModel.ArrivalTime)
                }
                .padding(.horizontal)
                .font(.title.bold())
                .buttonStyle(.plain)
                
                Spacer()
            }
//            Text("\(latitude)  \(longitude)")
                .onChange(of: latitude) { newValue in
     
                    viewModel.chenge(goalLat: goal.latitude, goalLon: goal.longitude)
                }
            //viewModel.
            //            Text("\(tpl.latitude)  \(tpl.longitude)")
            
            Spacer()
            
            Image("V")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.primary)
                .rotationEffect(Angle(degrees: viewModel.angle - viewModel.heading))
                .padding(.horizontal, 100.0)
            
            Spacer()
            
            Text("\(viewModel.Distance)m")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: viewModel.locationManager.latitude, longitude: viewModel.locationManager.longitude), latitudinalMeters: Meters, longitudinalMeters: Meters))  ,
                interactionModes: .zoom,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
            
            //TODO: -書き方？
            .mask(
                Image("HalfCircle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        }
       
        
        //TODO: -書き方？
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitle("", displayMode: .inline)
        
        
        //        }
        //iPad対応
        .navigationViewStyle(.stack)
        
        .onAppear(){

            
            viewModel.chenge(goalLat: goal.latitude, goalLon: goal.longitude)

            
            //            viewModel.tpl = tpl
            //            viewModel.lat2 = latitude
            //            viewModel.lon2 = longitude
            //            viewModel.angleViewmodel(lat: latitude, lon: longitude)
            
            //スリープさせない
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    
}

struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView(goal: (Destination: "String", latitude: 0.0, longitude: 0.0))
    }
}
