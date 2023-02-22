//
//  UserController.swift
//  BYOA Chess
//
//  Created by Chase on 2/22/23.
//

import Foundation

class UserController {
    
    static func fetchUser(forUser userName: String, completion: @escaping (User?) -> Void) {
        
        // MARK: - URL Construction
        guard let baseURL = URL(string: Constants.ChessURL.baseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(userName)
        guard let finalURL = urlComponents?.url else { completion(nil) ; return }
        
        print("Final Chess User URL: \(finalURL)")
        
        // MARK: - Fetch Data Using URL
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(nil) ; return }
            
            do {
                
                if let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any] {
                    
                    let userDetails = User(dictionary: topLevel)
                    completion(userDetails)
                    
                }
                
            } catch {
                
                print(error.localizedDescription)
                completion(nil) ; return
                
            }
            
        } .resume()
    }
}
