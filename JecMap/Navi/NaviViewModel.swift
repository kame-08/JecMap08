//
//  NaviViewModel.swift
//  JecMap
//
//  Created by Ryo on 2022/09/14.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit


class NaviViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @ObservedObject var locationManager: LocationManager = LocationManager()
    
    //    private let model = Locatio
    
    //移動手段
    @Published var Transportation = "figure.walk"
    //到着時刻
    @Published var ArrivalTime = "12:00"
    //あと何m
    @Published var Distance = 4
    
    @Published  var angle = 0.0
    
    //現在地
    //
    //    var latitude  = 0.0
    //    var longitude = 0.0
    
    //電子コンパスーーーーーー
    @Published var heading:CLLocationDirection = 0.0
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
        //電子コンパス設定
        manager.headingFilter = kCLHeadingFilterNone
        manager.headingOrientation = .portrait
        manager.startUpdatingHeading()
    }
    
    //電子コンパス値取得
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = newHeading.magneticHeading
    }
    
    //角度と距離
    func chenge (goalLat: Double, goalLon: Double) {
        angle = Double(angle(currentLatitude: locationManager.latitude, currentLongitude: locationManager.longitude, targetLatitude: goalLat, targetLongitude: goalLon))
        Distance = distance(currentLatitude: locationManager.latitude, currentLongitude: locationManager.longitude, targetLatitude: goalLat, targetLongitude: goalLon)
    }
    
    // 基準地の緯度経度から目的地の緯度経度の方角を計算する
    func angle(currentLatitude: CGFloat, currentLongitude: CGFloat, targetLatitude: CGFloat, targetLongitude: CGFloat) -> Int {
        
        let currentLatitude     = toRadian(currentLatitude)
        let currentLongitude    = toRadian(currentLongitude)
        let targetLatitude      = toRadian(targetLatitude)
        let targetLongitude     = toRadian(targetLongitude)
        
        let difLongitude = targetLongitude - currentLongitude
        let y = sin(difLongitude)
        let x = cos(currentLatitude) * tan(targetLatitude) - sin(currentLatitude) * cos(difLongitude)
        let p = atan2(y, x) * 180 / CGFloat.pi
        
        if p < 0 {
            return Int(360 + atan2(y, x) * 180 / CGFloat.pi)
        }
        return Int(atan2(y, x) * 180 / CGFloat.pi)
    }
    
    // 角度からラジアンに変換
    func toRadian(_ angle: CGFloat) -> CGFloat {
        return angle * CGFloat.pi / 180
    }
    
    //距離ーーーーー
    
    
    func distance(currentLatitude: CGFloat, currentLongitude: CGFloat, targetLatitude: CGFloat, targetLongitude: CGFloat) -> Int  {
        let p1:CLLocation = CLLocation(latitude:currentLatitude, longitude:currentLongitude)
        let p2:CLLocation = CLLocation(latitude:targetLatitude, longitude:targetLongitude)
        //TODO: Int外してkm表示に
        return Int(p1.distance(from: p2))
    }
    
    
}


