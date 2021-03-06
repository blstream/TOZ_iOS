//
//  CalendarWeekOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class GetScheduleWeekOperation: ServiceOperation {
    private let request: CalendarWeekRequest

    private(set) var result: RequestResult<[ReservationItem]>?
    var resultCompletion: ((RequestResult<[ReservationItem]>) -> Void)?

    public init(fromDate: String, toDate: String) {
        self.request = CalendarWeekRequest(fromDate: fromDate, toDate: toDate)
        super.init()
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

    func callCompletion(_ result: RequestResult<[ReservationItem]>) {
        self.result = result
        resultCompletion?(result)
    }

}
