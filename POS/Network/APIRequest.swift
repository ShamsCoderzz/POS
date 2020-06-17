//
//  APIRequest.swift
//  AlamofireTask
//
//  Created by Muhammad Shams on 07/06/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import NVActivityIndicatorView


class APIRequest : BaseViewController {
    
    static weak var delegate : ApiResponseDelegate?
    var activityIndicator : NVActivityIndicatorView!
    
    class func callAPI(url : String , header : HTTPHeaders , params : Parameters?, flagType : String) {
        
    if  Connectivity.isConnectedToInternet {
          
        let action : HTTPMethod
        if params != nil { action = .post } else  { action = .get }
      
                
        AF.request(url, method: action , parameters: params, headers: header).responseJSON { (response) in
                   switch response.result {
                   case .success:
                    delegate?.onApiResponse(response: response, flag: flagType)
                       break
                   case .failure(let error):
                    delegate?.onFailure(error : error.localizedDescription)
                       break
                   }  }
        } else { delegate?.onFailure(error : "Check your internet connection")  }
    }

   
}

class Connectivity {
        class var isConnectedToInternet : Bool {
            return NetworkReachabilityManager()?.isReachable ?? false
        }
}



