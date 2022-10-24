//
//  ContentViewModel.swift
//  JecMap
//
//  Created by Ryo on 2022/09/21.
//

import Foundation
import CoreLocation

class ContentViewModel:ObservableObject {
    
    let jec: [Jec] = [
        //入口
        Jec(nun: 1, name: "本館", location: CLLocationCoordinate2D(latitude: 35.69820, longitude: 139.69810), aed: true),
        Jec(nun: 2, name: "2号館", location: CLLocationCoordinate2D(latitude: 35.6989985881511, longitude: 139.69796247142756), aed: false),
        //入口
        Jec(nun: 3, name: "3号館", location: CLLocationCoordinate2D(latitude: 35.69850, longitude: 139.69828), aed: false),
        //入口
        Jec(nun: 4, name: "4号館", location: CLLocationCoordinate2D(latitude: 35.69875, longitude: 139.69820), aed: false),
        //入口
        Jec(nun: 5, name: "5号館", location: CLLocationCoordinate2D(latitude: 35.69892, longitude: 139.69750), aed: false),
        Jec(nun: 6, name: "6号館", location: CLLocationCoordinate2D(latitude: 35.69842508965526, longitude: 139.69796247142745), aed: false),
        //入口
        Jec(nun: 7, name: "7号館", location: CLLocationCoordinate2D(latitude: 35.69888, longitude: 139.69680), aed: true),
        //入口
        Jec(nun: 8, name: "8号館", location: CLLocationCoordinate2D(latitude: 35.69745, longitude: 139.69784), aed: true),
        //メディアホール入口
        Jec(nun: 9, name: "9号館", location: CLLocationCoordinate2D(latitude: 35.69900, longitude: 139.69800), aed: true),
        Jec(nun: 10, name: "10号館", location: CLLocationCoordinate2D(latitude: 35.69955123784045, longitude: 139.6979809137563), aed: false),
        Jec(nun: 11, name: "11号館", location: CLLocationCoordinate2D(latitude: 35.70089900147449, longitude: 139.69795110478069), aed: true),
        //入口
        Jec(nun: 12, name: "12号館", location: CLLocationCoordinate2D(latitude: 35.69530, longitude: 139.69900, aed: true)
    ]
    
}

struct Jec: Identifiable {
    var id = UUID()
    var nun: Int
    var name: String
    var location: CLLocationCoordinate2D
    var aed: Bool
}
