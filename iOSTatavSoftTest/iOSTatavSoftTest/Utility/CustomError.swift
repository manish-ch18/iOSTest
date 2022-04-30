//
//  CustomError.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import Foundation

//MARK: Custom Error
public struct CustomError: Error {
    let message: String

}


extension CustomError: LocalizedError {
    public var errorDescription: String? {
            return NSLocalizedString(message, comment: "")
    }
}
