//
//  Manager.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import Foundation

class APIManager: NSObject{
    
    //MARK: Singleton Class Object
    static let shared: APIManager = APIManager()
    
    let baseUrl = "http://sd2-hiring.herokuapp.com/api/"
    
    func getUserdata(userURL: String, completion: @escaping ((_ userResult: UserData) -> ())){
        
    }
}
