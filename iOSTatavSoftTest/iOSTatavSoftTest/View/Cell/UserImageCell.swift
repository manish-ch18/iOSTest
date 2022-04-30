//
//  UserImageCell.swift
//  iOSTatavSoftTest
//
//  Created by Nilu Technologies - 9 on 30/04/22.
//

import UIKit

class UserImageCell: UICollectionViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    
    var strImageURL: String? {
        didSet {
            if let strImageURL = strImageURL {
                imgUser.setImageUsingUrlSession(strImageURL, placeholder: AppConstants.placeholdeImage)
            }
        }
    }
    
}
