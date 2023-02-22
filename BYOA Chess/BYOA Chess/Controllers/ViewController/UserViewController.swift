//
//  UserViewController.swift
//  BYOA Chess
//
//  Created by Chase on 2/22/23.
//

import UIKit

class UserViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userFollowerLabel: UILabel!
    @IBOutlet weak var userLocationLabel: UILabel!
    @IBOutlet weak var userLeagueLabel: UILabel!
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchChessUser()
//        let searchBar = UISearchBar()
//        searchBar.delegate = self
    }
    
    // MARK: - Properties
    var userDetails: User?
    
    // MARK: - Function
    func fetchChessUser() {
        
        UserController.fetchUser(forUser: "chase_hill9") { user in
            self.userDetails = user
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    func updateViews() {
        guard let userDetails = userDetails else { return }
        userNameLabel.text = "Name: \(userDetails.name)"
        userFollowerLabel.text = "Followers: \(userDetails.followers)"
        userLocationLabel.text = "Location: \(userDetails.location)"
        userLeagueLabel.text = "Current League: \(userDetails.league)"
//        userAvatarImage.image = userDetails.avatar
    }
}
