//
//  ProcessUUID.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/18.
//

import Foundation

struct ProcessUUID {
    static func getIntraByUUID(uuid: String) -> String {
        let db = tmpDB().db
        // 나중에 DB를 fireStore로 변경
        if let intraId = db[uuid] {
            return intraId
        } else {
            return "undefined"
        }
    }
}
