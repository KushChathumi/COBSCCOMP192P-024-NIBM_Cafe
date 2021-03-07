//
//  Service.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-01.
//

import UIKit
import Firebase

class Service{
    
    static func signUpUser(name: String, email: String, password:String, contact:String, onSuccess:@escaping()-> Void, onError: @escaping(_ error:Error?)-> Void ){
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { (authresult, error) in
            if error != nil
            {
                onError(error!)
                return
            }
            uploadToDatabse(name: name, email: email, contact: contact, onSuccess: onSuccess )
        }
        
        func uploadToDatabse(name: String, email: String, contact:String, onSuccess:@escaping()-> Void){
            let ref = Database.database().reference()
            let uid = Auth.auth().currentUser?.uid
            
            ref.child("users").child(uid!).setValue(["name":name, "email": email, "Contact": contact])
            onSuccess()
        }
        
    }
    
    static func createAlertController (title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            //alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        return alert
    }
}



