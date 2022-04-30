//
//  UserDataCell.swift
//  iOSTatavSoftTest
//
//  Created by Nilu Technologies - 9 on 30/04/22.
//

import UIKit

class UserDataCell: UITableViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var collectionUserImages: UICollectionView!
    
    var arrUserData = [String]()
    
    var userDetail: Users? {
        didSet {
            lblUserName.text = userDetail?.name
            if let strUserImageURL = userDetail?.image{
                imgUser.setImageUsingUrlSession(strUserImageURL, placeholder: AppConstants.placeholdeImage)
            }
            arrUserData = userDetail?.items ?? []
            collectionUserImages.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UserDataCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrUserData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserImageCell", for: indexPath) as? UserImageCell else { return UICollectionViewCell() }
        cell.strImageURL = arrUserData[indexPath.row]
        return cell
    }
    
}

// MARK: Collectionview - UICollectionViewDelegateFlowLayout method
extension UserDataCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if arrUserData.count % 2 == 0 || indexPath.row > 0 {
            return CGSize(width: AppConstants.screenWidth/2 - 30, height: AppConstants.screenWidth/2 - 30)
        }
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }
}
