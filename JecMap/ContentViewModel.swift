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
        Jec(nun: 1, name: "本館", location: CLLocationCoordinate2D(latitude: 35.69857244753979, longitude: 139.6981410560849), aed: true),
        Jec(nun: 2, name: "2号館", location: CLLocationCoordinate2D(latitude: 35.6989985881511, longitude: 139.69796247142756), aed: false),
        Jec(nun: 3, name: "3号館", location: CLLocationCoordinate2D(latitude: 35.69868166322867, longitude: 139.69839971375617), aed: false),
        Jec(nun: 4, name: "4号館", location: CLLocationCoordinate2D(latitude: 35.698926436943914, longitude: 139.69819260026327), aed: false),
        Jec(nun: 5, name: "5号館", location: CLLocationCoordinate2D(latitude: 35.6990939365779, longitude: 139.69743022724919), aed: false),
        Jec(nun: 6, name: "6号館", location: CLLocationCoordinate2D(latitude: 35.69842508965526, longitude: 139.69796247142745), aed: false),
        Jec(nun: 7, name: "7号館", location: CLLocationCoordinate2D(latitude: 35.69894094701618, longitude: 139.69653272724912), aed: true),
        Jec(nun: 8, name: "8号館", location: CLLocationCoordinate2D(latitude: 35.69761045281154, longitude: 139.69779081005694), aed: true),
        Jec(nun: 9, name: "9号館", location: CLLocationCoordinate2D(latitude: 35.69938827675634, longitude: 139.69801154259176), aed: true),
        Jec(nun: 10, name: "10号館", location: CLLocationCoordinate2D(latitude: 35.69955123784045, longitude: 139.6979809137563), aed: false),
        Jec(nun: 11, name: "11号館", location: CLLocationCoordinate2D(latitude: 35.70089900147449, longitude: 139.69795110478069), aed: true),
        Jec(nun: 12, name: "12号館", location: CLLocationCoordinate2D(latitude: 35.69554665009267, longitude: 139.69899678492044), aed: true)
    ]
    
}

struct Jec {
    var nun: Int
    var name: String
    var location: CLLocationCoordinate2D
    var aed: Bool
}
