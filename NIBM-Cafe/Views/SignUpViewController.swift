//
//  SignUpViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-02-26.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var ContactNumberTextField: UITextField!
    
    @IBOutlet weak var PasswordTextFiled: UITextField!
    
    @IBOutlet weak var SignupButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    //Hide the error msg lable
    func setUpElements() {
        ErrorLable.alpha=0
    }
    
    //Validate the fileds

    @IBAction func SignupTapped(_ sender: Any) {
        
        Service.signUpUser(name: NameTextField.text!,email: EmailTextField.text!, password: PasswordTextFiled.text!, contact: ContactNumberTextField.text!) {
            
            let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
            
            self.view.window?.rootViewController = HomeTabBarController
            self.view.window?.makeKeyAndVisible()
        } onError: { (error) in
            self.ErrorLable.text = error?.localizedDescription
            self.ErrorLable.alpha = 1
        }

           
        }
}
     




