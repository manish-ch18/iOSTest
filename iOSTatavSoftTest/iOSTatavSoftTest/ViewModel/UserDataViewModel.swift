//
//  UserDataViewModel.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import Foundation

protocol UserDataViewModelDelegate: AnyObject{
    func updateUserData()
}

class UserDataViewModel{
    
    
    weak var delegate: UserDataViewModelDelegate?
    var arrUserData = [Users]()
    var hasMoreData = false
    
    init(delegate: UserDataViewModelDelegate) {
        self.delegate = delegate
    }
    
    
    func getUsers() {
        
        APIManager.shared.getUserdata(userURL: "users?offset=\(arrUserData.count)&limit=10") { userData, error in
            self.arrUserData.append(contentsOf: userData?.users ?? [])
            self.hasMoreData = userData?.has_more ?? false
            self.delegate?.updateUserData()
        }
    }
    
}
