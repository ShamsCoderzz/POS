//
//  APIRequest.swift
//  POS
//
//  Created by Muhammad Shams on 11/03/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation

struct APIRequest {
    
    let baseUrl = "http://ec2-18-206-250-232.compute-1.amazonaws.com:3000"
    
    
    func LoginAPIRequest(_ username: String, _ password: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
        
        
       let loginURL = URL(string: "\(baseUrl)/user/login")!
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST" //set http method as POST

        let parameters  : [String: Any] = ["username" : username,"password" : password]
           
        do{
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        }catch {
            print(error.localizedDescription)
        }
           
            

        
        //create dataTask using the session object to send data to the server
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            let response = response as? HTTPURLResponse
            
            print(response!)

            if error != nil {
                completion(nil, error)
                return
            }
            
        
            
         let dataString = String(data: data!, encoding: .utf8)

          //  completion(dataString!,nil)
        print(dataString!)
            
        })

        task.resume()
    }

    
    
    
}
