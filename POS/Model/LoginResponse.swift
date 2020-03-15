//
//  LoginResponse.swift
//  POS
//
//  Created by Muhammad Shams on 15/03/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation

struct LoginResponse : Codable {
    let status : Int?
    let message : String?
    let response : String?
    
}
