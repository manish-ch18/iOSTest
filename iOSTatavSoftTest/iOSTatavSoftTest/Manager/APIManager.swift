//
//  APIManager.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import Foundation


//MARK: APIManage Singleton class
class APIManager: NSObject{
    
    //MARK: Singleton Class Object
    static let shared: APIManager = APIManager()
    
    let baseUrl = "http://sd2-hiring.herokuapp.com/api/"
    
    //MARK: Get users data
    func getUserdata(userURL: String, completion: @escaping ((_ userData: UserData?, _ error: Error?) -> ())){
        
        guard let url = URL(string: baseUrl + userURL) else{
            let error = CustomError(message: "Invalid Url")
            completion(nil, error)
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
            }
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(Base.self, from: data)
                    completion(res.data, nil)
                } catch let error{
                    completion(nil, error)
                }
            }else{
                let error = CustomError(message: "Invalid Data")
                completion(nil, error)
            }
        }.resume()
    }
}
