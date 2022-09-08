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
    
    var body: some View {
        VStack{
            Spacer()
            TabView(selection: $selection) {
                hoge(title: "本館")
                    .tag(1)
                
                ForEach(2..<13) { i in
                    hoge(title: "\(i)号館")
                        .tag(i)
                }
            }
            //            .tabViewStyle(.page)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.onChange(of: selection) { newValue in
            if newValue == 1 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.698785, longitude: 139.696548), latitudinalMeters: 300, longitudinalMeters: 300)
            } else if newValue == 2 {
                pin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.598785, longitude: 139.596548), latitudinalMeters: 300, longitudinalMeters: 300)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(pin: .constant(MKCoordinateRegion()))
    }
}

struct hoge: View {
    @State var title:String
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            Rectangle()
                .frame(width: 100.0, height: 100.0)
                .cornerRadius(10)
            
            Text("\(title)")
                .font(.title)
            VStack {
                
            
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("出発")
                    }.buttonStyle(.borderedProminent)
                }
                
                
            }
            Spacer()
            
        }
        .padding(.all)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding(.all)
    }
}
