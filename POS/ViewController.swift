//
//  ViewController.swift
//  POS
//
//  Created by Muhammad Shams on 10/03/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var dontHaveAnAccount: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addLeftImageToUITextField(textField: userName , img: #imageLiteral(resourceName: "icons.png") )
        
        signIn.layer.cornerRadius = 5
        signIn.layer.borderColor = UIColor.black.cgColor
        
        
        apiRequest.LoginAPIRequest(username: "sss", password: "sss") { (result , error) in
            
            
            if let _result = result {
                print(_result)
            }
        }
        
        
    }
    
    
    
    func addLeftImageToUITextField(textField : UITextField , img : UIImage){
        
        let leftImage = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width/2, height: img.size.height/2))
        
        leftImage.image = img
        
        textField.leftView = leftImage
        textField.leftViewMode = .always
    }


}

