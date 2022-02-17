//
//  FrontView.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import SwiftUI

struct FrontView: View {
    @ObservedObject var locationManager: LocationManager
    let intraId: String = "hakim"
    /* DB의 idfv와 기기의 idfv를 비교해 받아올 예정
     let uuid = UIDevice.current.identifierForVendor!.uuidString */
    
    var body: some View {
        VStack {
            Text("Apus Check-In")
                .font(.largeTitle)
                .fontWeight(.thin)
            Spacer()
            EntranceButton(isInLocation: locationManager.isNear).padding(.bottom)
            Spacer()
            Text("Intra ID: \(intraId)")
                .font(.title2).fontWeight(.ultraLight)
            Text("My distance from Cluster: \(Int(locationManager.myDistanceFromCluster)) meter")
                .font(.title2).fontWeight(.ultraLight)
                .padding(.bottom)
                .multilineTextAlignment(.center)
        }
    }
}

struct EntranceButton: View {
    var isInLocation: Bool
    var body: some View {
        Button {
            //action has to be defined
        } label: {
            if isInLocation == true {
                Image("coloredApus").resizable()
            } else {
                Image("uncoloredApus").resizable()
            }
        }
        .frame(width: self.buttonWidth(),
               height: self.buttonHeight())
        .disabled(!isInLocation)
    }
    
    private func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 1.2
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 1.2
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        let checkin = LocationManager()
        FrontView(locationManager: checkin)
    }
}
