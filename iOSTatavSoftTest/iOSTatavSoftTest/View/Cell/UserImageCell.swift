//
//  UserImageCell.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import UIKit

class UserImageCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var imgUser: UIImageView!
    var strImageURL: String? {
        didSet {
            if let strImageURL = strImageURL {
                imgUser.setImageUsingUrlSession(strImageURL, placeholder: AppConstants.placeholdeImageForUser)
            }
        }
    }
}
