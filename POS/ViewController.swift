//
//  ViewController.swift
//  POS
//
//  Created by Muhammad Shams on 10/03/2020.
//  Copyright © 2020 Muhammad Shams. All rights reserved.
//

import UIKit


extension ViewController : UITextFieldDelegate {
    
    // when user click on return on search
          func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              // closed keyboard
            switch textField {
            case userName:
                password.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
              return false
          }
          
       
          
          // when user click on search btn
          func textFieldDidEndEditing(_ textField: UITextField) {
              
          }
    
}

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dontHaveAnAccount: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.delegate = self
        password.delegate = self
        // Do any additional setup after loading the view.
        
     //   addLeftImageToUITextField(textField: userName , img: #imageLiteral(resourceName: "icons.png") )
        
     
        
        addBorderAndRound(btn : signIn)
        addBorderAndRound(btn: dontHaveAnAccount)
        
                
        
    }
    
    @IBAction func loginClickListner(_ sender: UIButton) {
        LoginAPI(username: userName.text!, password: password.text!)
    }
    
    
    @IBAction func DontHaveAnAccocuntListner(_ sender: Any) {
    }
    
    
    func  LoginAPI(username : String , password : String){
        
        apiRequest.LoginAPIRequest(username, password) { (result, error) in
            guard let error = error else { return  }
            guard let response = result else { print(error.localizedDescription) ;  return }
            
            if response.status == 1 {
                
            }else {
                print(response.message!)
            }
        }
    }
    
    func addBorderAndRound(btn : UIButton){
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
    }
    
    
    
    func addLeftImageToUITextField(textField : UITextField , img : UIImage){
        
        let leftImage = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width/2, height: img.size.height/2))
        
        leftImage.image = img
        
        textField.leftView = leftImage
        textField.leftViewMode = .always
    }


}

