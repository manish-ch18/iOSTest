//
//  CustomError.swift
//  iOSTatavSoftTest
//
//  Created by Nilu Technologies - 9 on 30/04/22.
//

import Foundation

public struct CustomError: Error {
    let message: String

}


extension CustomError: LocalizedError {
    public var errorDescription: String? {
            return NSLocalizedString(message, comment: "")
    }
}
