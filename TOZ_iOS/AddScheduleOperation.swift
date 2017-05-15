//
//  AddScheduleOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class AddScheduleOperation: ServiceOperation {
    private let request: AddScheduleRequest

    private(set) var result: RequestResult<ReservationItem>?
    var resultCompletion: ((RequestResult<ReservationItem>) -> Void)?

    public init(dataObject: ReservationItem, modificationMessage: String) {
        self.request = AddScheduleRequest(dataObject: dataObject, modificationMessage: modificationMessage)
    }

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try GetScheduleResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<ReservationItem>) {
        self.result = result
        resultCompletion?(result)
    }

}
