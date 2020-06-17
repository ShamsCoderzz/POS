//
//  ApiResponseDelegate.swift
//  AlamofireTask
//
//  Created by Muhammad Shams on 08/06/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiResponseDelegate : AnyObject {
    func onApiResponse(response : AFDataResponse<Any>, flag : String)
    func onFailure(error : String)
}
