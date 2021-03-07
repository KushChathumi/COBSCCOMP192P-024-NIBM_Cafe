//
//  ForgerPasswordViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-02-28.
//

import UIKit
import Firebase


class ForgerPasswordViewController: UIViewController {

    @IBOutlet weak var EmailTextFiled: UITextField!
    @IBOutlet weak var SendButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        ErrorLable.alpha=0}
    
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: EmailTextFiled.text!) { (error) in
            if let error = error{
                let alert = Service.createAlertController(title: "Error!", message: error.localizedDescription)
                //self.present(animatio)
                self.ErrorLable.text = error.localizedDescription
                self.ErrorLable.alpha = 1
                return
            }
            
            let alert = Service.createAlertController(title: "Done", message: "A Password reset Email has been sent!")
            self.ErrorLable.text = error?.localizedDescription
            self.ErrorLable.alpha = 1
        }
    }
}
