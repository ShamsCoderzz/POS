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
        
        
        if userName.text!.isEmpty {
            self.alertDialog("Username Required")
            return
        }
        
        if password.text!.isEmpty {
            self.alertDialog("Password Required")
            return
        }
        
        LoginAPI(userName.text!,password.text!)
    }
    
    
    @IBAction func DontHaveAnAccocuntListner(_ sender: Any) {
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
    
    
    func  LoginAPI(_ username : String ,_ password : String){
        
        apiRequest.LoginAPIRequest(username, password) { (result, error) in
            guard let response = result else {
                self.alertDialog(error!.localizedDescription) ;  return }
            
            if response.status == 1 {
                
            }else {
                
                self.alertDialog(response.message!)
                
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

