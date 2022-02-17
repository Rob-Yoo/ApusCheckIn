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
    var body: some Scene {
        WindowGroup {
            FrontView(locationManager: checkin)
        }
    }
}
