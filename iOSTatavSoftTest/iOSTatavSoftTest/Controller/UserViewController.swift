//
//  ViewController.swift
//  iOSTatavSoftTest
//
//  Created by Manish on 30/04/22.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var tblUserData: UITableView!
    
    var userDataVM: UserDataViewModel?
    var rowHeight = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        self.userDataVM = UserDataViewModel(delegate: self)
        self.userDataVM?.getUsers()
    }


}

extension UserViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataCell", for: indexPath) as? UserDataCell else { return UITableViewCell() }
        return cell
    }

}

extension UserViewController: UserDataViewModelDelegate{
    func updateUserData() {
        DispatchQueue.main.async {
            self.tblUserData.reloadData()
        }
    }
}

