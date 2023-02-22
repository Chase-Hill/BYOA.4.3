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
    
    let userImage = URL(string: "https://images.chesscomfiles.com/uploads/v1/user/82160827.7a3b271a.200x200o.d69236c7e85a.jpeg")
    
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
        userNameLabel.text = "Player Name: \(userDetails.name)"
        userFollowerLabel.text = "Player Followers: \(userDetails.followers)"
        userLocationLabel.text = "Player Location: \(userDetails.location)"
        userLeagueLabel.text = "Player Current League: \(userDetails.league)"
        userAvatarImage.loadFromURL(url: userImage!)
    }
}

//MARK: - EXTENSION

extension UIImageView {
    func loadFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
