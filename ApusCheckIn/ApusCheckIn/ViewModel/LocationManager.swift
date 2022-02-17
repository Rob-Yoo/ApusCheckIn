//
//  LocationManager.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
    }
    
    /* below is what I appended */
    
    var userLatitude: Double { lastLocation?.coordinate.latitude ?? 0 }
    
    var userLongitude: Double { lastLocation?.coordinate.longitude ?? 0 }
    
    var myDistanceFromCluster: Double {
        LocationManager.haversineDistance(la1: 37.48815449911871,
                              lo1: 127.06476621423361, // coordinate of Gaepo Custer
                              la2: userLatitude,
                              lo2: userLongitude)
    }
    
    func isNear() -> Bool {
        if myDistanceFromCluster > 100 {
            return false
        } else {
            return true
        }
    }
    
    static func haversineDistance(la1: Double, lo1: Double, la2: Double, lo2: Double, radius: Double = 6367444.7) -> Double {
        let haversin = { (angle: Double) -> Double in
            return (1 - cos(angle)) / 2
        }
        
        let ahaversin = { (angle: Double) -> Double in
            return 2 * asin(sqrt(angle))
        }
        
        let dToR = { (angle: Double) -> Double in
            return (angle / 360) * 2 * .pi
        }
        
        let lat1 = dToR(la1)
        let lon1 = dToR(lo1)
        let lat2 = dToR(la2)
        let lon2 = dToR(lo2)
        
        return radius * ahaversin(haversin(lat2 - lat1) + cos(lat1) * cos(lat2) * haversin(lon2 - lon1))
    }
    
}
