//
//  UserViewController.swift
//  BYOA Chess
//
//  Created by Chase on 2/22/23.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userFollowerLabel: UILabel!
    
    @IBOutlet weak var userLocationLabel: UILabel!
    
    @IBOutlet weak var userLeagueLabel: UILabel!

    @IBOutlet weak var userAvatarImage: UIImageView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Properties
    
    var userDetails: User? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Function
    
    func updateViews() {
     
        guard let userDetails = userDetails else { return }
        userNameLabel.text = "Name: \(userDetails.name)"
        userFollowerLabel.text = "Followers: \(userDetails.followers)"
        userLocationLabel.text = "Location: \(userDetails.location)"
        userLeagueLabel.text = "Current League: \(userDetails.league)"
        userAvatarImage.image = userDetails.avatar
    }
}
