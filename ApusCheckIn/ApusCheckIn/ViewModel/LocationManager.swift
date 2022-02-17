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
    
    private var userLatitude: Double { lastLocation?.coordinate.latitude ?? 0 }
    
    private var userLongitude: Double { lastLocation?.coordinate.longitude ?? 0 }
    
    let processLocation = ProcessLocation()
    
    var myDistanceFromCluster: Double {
        processLocation.haversineDistance(
                              la1: 37.48815449911871,
                              lo1: 127.06476621423361, // coordinate of Gaepo Custer
                              la2: userLatitude,
                              lo2: userLongitude)
    }
    var isNear: Bool {
        processLocation.isNear(myDistance: myDistanceFromCluster)
    }
}
