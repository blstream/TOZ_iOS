//
//  RequestError.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case FailedToSerializeJSON
    case InvalidResponse
    case ConnectionError(Error)
    case InvalidRequest
    case UnexpectedNetworkError
    case ServerRespondedWithErrorField(String)
}
