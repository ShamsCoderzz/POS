//
//  BaseViewController.swift
//  POS
//
//  Created by Muhammad Shams on 16/06/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController , NVActivityIndicatorViewable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alertDialog(_ error: String) {
        
        DispatchQueue.main.async {
             let alert=UIAlertController(title: "Warning!!", message: error, preferredStyle: .alert)
                 self.present(alert, animated: true, completion: nil)
                    // add button
                    let cancelBtn=UIAlertAction(title: "Cancle", style: .cancel) { (action) in
                        print("cancel")
                    }
                    
                    alert.addAction(cancelBtn)
        }
    }
    
    
    func startprogress() {
           let size = CGSize(width: 50, height: 50)
           startAnimating(size, message: nil, type: .ballClipRotatePulse, color: .white)
         }


    func stopprogress() {
           stopAnimating()
       }

}
