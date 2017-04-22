//
//  AddScheduleOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class AddScheduleOperation: ServiceOperation {
    private let request: AddScheduleRequest

    private(set) var result: RequestResult<[ScheduleItem]>?
    var resultCompletion: ((RequestResult<[ScheduleItem]>) -> Void)?

    public init(idObject: String, dataObject: ScheduleItem.ReservationItem) {
        self.request = AddScheduleRequest(idObject: idObject, dataObject: dataObject)
    }

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try ScheduleResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<[ScheduleItem]>) {
        self.result = result
        resultCompletion?(result)
    }

}
