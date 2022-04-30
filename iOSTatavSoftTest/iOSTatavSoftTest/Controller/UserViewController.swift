//
//  ViewController.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var tblUserData: UITableView!
    
    var userDataVM: UserDataViewModel?
    var rowHeight: CGFloat = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        self.userDataVM = UserDataViewModel(delegate: self)
        self.userDataVM?.getUsers()
    }


}

// MARK: Setting Up tableView Delegate & DataSource
extension UserViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userDataVM?.arrUserData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataCell", for: indexPath) as? UserDataCell else { return UITableViewCell() }
        cell.userDetail = self.userDataVM?.arrUserData[indexPath.row]
        if indexPath.row == (self.userDataVM?.arrUserData.count)! - 1 && ((self.userDataVM?.hasMoreData) != nil) {
            self.userDataVM?.getUsers()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let totalItems = self.userDataVM?.arrUserData[indexPath.row].items?.count
        if totalItems == 1 {
            return rowHeight + (AppConstants.screenWidth - 40)
        }
        if (totalItems ?? 0) % 2 == 0 {
            return totalItems == 2 ? rowHeight + AppConstants.screenWidth/2 : rowHeight + AppConstants.screenWidth
        }
        return totalItems == 3 ? rowHeight +  AppConstants.screenWidth * 1.5 - 20 : rowHeight + AppConstants.screenWidth * 2 - 20
    }
    
    

}

// MARK: View Model Dependency Injection
extension UserViewController: UserDataViewModelDelegate{
    func updateUserData() {
        DispatchQueue.main.async {
            self.tblUserData.reloadData()
        }
    }
}

