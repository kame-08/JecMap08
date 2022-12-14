//
//  NaviView.swift
//  JecMap
//
//  Created by Ryo on 2022/09/13.
//

import SwiftUI
import MapKit

struct NaviView: View {
    
    @StateObject var viewModel = NaviViewModel()
    
    @State var Meters: CLLocationDistance = 40
    
     var goal: (Destination: String,latitude: Double, longitude: Double)
    
    //現在地
//    @State var region = MKCoordinateRegion()
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        if viewModel.locationManager.latitude == 0{
            NoDataView()
        }else{
            //        let latitude  = $region.center.latitude.wrappedValue
            //        let longitude = $region.center.longitude.wrappedValue
            //        NavigationView {
            VStack {
                //            Text("\(viewModel.locationManager.latitude)")
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
                
                //                .onChange(of: latitude) { newValue in
                //
                //                    viewModel.chenge(goalLat: goal.latitude, goalLon: goal.longitude)
                //                    print("更新")
                //                }
                .onChange(of: viewModel.locationManager.latitude) { newValue in
                    
                    viewModel.chenge(goalLat: goal.latitude, goalLon: goal.longitude)
                    print("onChange")
                }
                //viewModel.
                //            Text("\(tpl.latitude)  \(tpl.longitude)")
                
                Spacer()
                
                Image("V")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("AccentColor"))
                    .rotationEffect(Angle(degrees: viewModel.angle - viewModel.heading))
                    .padding(.horizontal, 100.0)
                
                Spacer()
                
                Text("\(viewModel.Distance)m")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: viewModel.locationManager.latitude, longitude: viewModel.locationManager.longitude), latitudinalMeters: Meters, longitudinalMeters: Meters))  ,
                    interactionModes: [],
                    showsUserLocation: true
                    //                userTrackingMode: $userTrackingMode
                )
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                
                //TODO: -書き方？
                .mask(
                    Image("HalfCircle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            }
            
            
            //TODO: -書き方？
            //        .ignoresSafeArea(edges: .bottom)
            .navigationBarTitle("", displayMode: .inline)
            
            
            //        }
            //iPad対応
            .navigationViewStyle(.stack)
            
            .task{
                
                
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
    
}

struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView(goal: (Destination: "本館", latitude: 0.0, longitude: 0.0))
    }
}
