//
//  AppConstant.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import UIKit

struct AppConstants{
    static let screenSize: CGRect = UIScreen.main.bounds

    // Screen width.
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static let placeholdeImage = UIImage(systemName: "person.circle")
    static let placeholdeImageForUser = UIImage(systemName: "person.fill")
}
