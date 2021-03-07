//
//  LoginViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-02-26.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var EmailTextFiled: UITextField!
    
    @IBOutlet weak var PasswordTestField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setUpElements() {
        ErrorLable.alpha=0}
    
    
    @IBAction func LoginTapped(_ sender: Any) {
        
        let email=EmailTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password=PasswordTestField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.ErrorLable.text = error?.localizedDescription
                self.ErrorLable.alpha = 1
            }
            else{
                let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
                
                self.view.window?.rootViewController = HomeTabBarController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }

}
