//
//  AppConstant.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import UIKit

//MARK: AppConstants required in apps
struct AppConstants{
    //MARK: Screen Size
    static let screenSize: CGRect = UIScreen.main.bounds

    //MARK: Screen width.
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    //MARK: Screen height.
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    //MARK:  Placeholder Images
    static let placeholdeImage = UIImage(systemName: "person.circle")
    static let placeholdeImageForUser = UIImage(systemName: "person.fill")
}
