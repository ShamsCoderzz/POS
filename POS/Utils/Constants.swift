//
//  Constants.swift
//  AlamofireTask
//
//  Created by Muhammad Shams on 08/06/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation
import Alamofire
import NVActivityIndicatorView

public class Constants {
    
    
    static let baseUrl = "http://ec2-18-206-250-232.compute-1.amazonaws.com:3000"
    
    static let login = "/user/login"


    static let header : HTTPHeaders = [
        .authorization("application/json"),
        .contentType("application/json")
        ]
    
    
//     func startprogress() {
//
//               let size = CGSize(width: 50, height: 50)
//               startAnimating(size, message: nil, type: .ballClipRotatePulse, color: .white)
//           }
//         
//         
//         func stopprogress() {
//               stopAnimating()
//         }
    
}
