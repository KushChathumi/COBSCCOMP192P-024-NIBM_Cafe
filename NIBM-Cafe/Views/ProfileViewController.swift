//
//  ProfileViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-04.
//

import UIKit
import FirebaseStorage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   
    @IBOutlet weak var profileImageView: UIImageView!
    private let storage = Storage.storage().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.contentMode = .scaleToFill
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.clipsToBounds = true
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.profileImageView.image = image
            }
        })
        
        task.resume()

        // Do any additional setup after loading the view.
    }
    
        @IBAction func didTappedButton()
        {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true)
        }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:   [UIImagePickerController.InfoKey : Any]){
            picker.dismiss(animated: true, completion: nil)
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
                return
            }
            guard let imageData = image.pngData() else {
                return
            }
                storage.child("image/file.png").putData(imageData, metadata: nil, completion: {_, Error in
                guard Error == nil
                else{
                    print("Failed to upload")
                    return
                }
                    self.storage.child("image/file.png").downloadURL(completion: { url, Error in guard let url = url, Error == nil  else{
                        return
                    }
                
                    let urlString =  url.absoluteString
                    
                    DispatchQueue.main.async {
                        self.profileImageView.image = image
                    }
                    
                    print("Download URL:\(urlString)")
                    UserDefaults.standard.set(urlString, forKey: "url")
                })
        
                //Upload image data
        
            })  

            func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
                picker.dismiss(animated: true, completion: nil)
        }
    }
}
