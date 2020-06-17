//
//  APIRequest.swift
//  POS
//
//  Created by Muhammad Shams on 11/03/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation

struct Api {
    
    let baseUrl = "http://ec2-18-206-250-232.compute-1.amazonaws.com:3000"
    
    
    func aa(string : String , completion : @escaping (Int,  String) -> Void ){
        
        
        completion(10, "")
    }
    
    // escaping performing any asynchronous tasks inside the function like  function store data into database or update UI on same function 
    func LoginAPIRequest(_ username: String, _ password: String, completion: @escaping (LoginResponse?, Error?) -> Void ){
        
        
       let loginURL = URL(string: "\(baseUrl)/user/login")!
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST" //set http method as POST
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let parameters  : [String: Any] = ["username" : username,"password" : password]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        }catch {
           completion(nil, error)
        }
        
        //create dataTask using the session object to send data to the server
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            let responseCode = response as? HTTPURLResponse
            
            if error != nil || data == nil {
                completion(nil, error)
                return
            }
            
            guard let httpsResponse = responseCode, (200...299).contains(httpsResponse.statusCode) else {
                do {
                    let json = try JSONDecoder().decode(LoginResponse.self, from: data!)
                    completion(json, nil)
                }catch {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let json = try JSONDecoder().decode(LoginResponse.self, from: data!)
                completion(json, nil)
            }catch {
                completion(nil, error)
            }
            
        })

        task.resume()
    }
    
  

    
    
    
}
