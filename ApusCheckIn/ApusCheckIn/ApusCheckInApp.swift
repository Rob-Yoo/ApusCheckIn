//
//  ApusCheckInApp.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import SwiftUI

@main
struct ApusCheckInApp: App {
    let checkin = LocationManager()
    let uuidManager = UUIDManager(uuid: UIDevice.current.identifierForVendor!.uuidString)
    var body: some Scene {
        WindowGroup {
            FrontView(
                locationManager: checkin,
                uuidManager: uuidManager
            )
        }
    }
}
