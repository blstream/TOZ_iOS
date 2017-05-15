//
//  AddScheduleRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class AddScheduleRequest: BackendAPIRequest {

    private let dataObject: ReservationItem
    private let modificationMessage: String

    init(dataObject: ReservationItem, modificationMessage: String) {
        self.dataObject = dataObject
        self.modificationMessage = modificationMessage
    }

    var endpoint: String {
        return "/schedule"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {

        var startTime = ""
        var endTime = ""
        if dataObject.timeOfDay == .morning {
            startTime = "08:00"
            endTime   = "12:00"
        } else {
            startTime = "12:00"
            endTime   = "16:00"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: dataObject.date)

        var parametersInDictionary: [String: Any] = [:]
        parametersInDictionary["date"] = date
        parametersInDictionary["startTime"] = startTime
        parametersInDictionary["endTime"] = endTime
        parametersInDictionary["modificationMessage"] = modificationMessage
        if let ownerSurname = dataObject.ownerSurname {
            parametersInDictionary["ownerSurname"] = ownerSurname
        }
        if let ownerForename = dataObject.ownerSurname {
            parametersInDictionary["ownerForename"] = ownerForename
        }

        return parametersInDictionary
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
