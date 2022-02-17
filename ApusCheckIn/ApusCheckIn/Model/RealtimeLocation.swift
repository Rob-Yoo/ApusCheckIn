//
//  RealtimeLocation.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import Foundation

//
//class RealtimeLocation: ObservableObject {
//    @Published var locationManager = LocationManager()
//    
//    private func haversineDistance(la1: Double, lo1: Double, la2: Double, lo2: Double, radius: Double = 6367444.7) -> Double {
//        
//        let haversin = { (angle: Double) -> Double in
//            return (1 - cos(angle)) / 2
//        }
//        
//        let ahaversin = { (angle: Double) -> Double in
//            return 2 * asin(sqrt(angle))
//        }
//        
//        let dToR = { (angle: Double) -> Double in
//            return (angle / 360) * 2 * .pi
//        }
//        
//        let lat1 = dToR(la1)
//        let lon1 = dToR(lo1)
//        let lat2 = dToR(la2)
//        let lon2 = dToR(lo2)
//        
//        return radius * ahaversin(haversin(lat2 - lat1) + cos(lat1) * cos(lat2) * haversin(lon2 - lon1))
//    }
//    
//    private var userLatitude: Double { locationManager.lastLocation?.coordinate.latitude ?? 0 }
//    
//    private var userLongitude: Double { locationManager.lastLocation?.coordinate.longitude ?? 0 }
//
//    var myDistanceFromCluster: Double {
//        haversineDistance(la1: 37.48815449911871, lo1: 127.06476621423361, la2: userLatitude, lo2: userLongitude) // coordinate of Gaepo Custer
//    }
//    
//    func isInLocation() -> Bool {
//        if myDistanceFromCluster > 100 {
//            return false
//        } else {
//            return true
//        }
//    }
//}
