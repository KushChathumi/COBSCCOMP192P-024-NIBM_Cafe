//
//  ResturantViewController.swift
//  NIBM-Cafe
//
//  Created by Kushani Abeysinghe on 2021-03-07.
//

import UIKit
import FirebaseAuth

class ResturantViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    var foods = [
        Food(dictionary: ["name":"Double Cheese Burger", "description": "Tangy pickle, chopped onions, ketchup, mustard, and two slices of melted American cheese.", "price":"LKR 650", "place": "Burger King", "distanc": "0.5km"]),
        Food(dictionary: ["name":"Chocolate Delights ", "description": "A tempting delicacy made with chocolate chips and topped with rice chocolet sauce", "price":"LKR 250", "place": "Royal Bakery","distanc": "0.5km"]),
        Food(dictionary: ["name":"Pasta Salad", "description": "Pasta, red onion, carrots, tomatoes, broccoli florets, white wine vinegar", "price":"LKR 550", "place": "Caravan Fresh","distanc": "0.5km"]),
        Food(dictionary: ["name":"Chocolate Melt Lava Cake", "description": "Soft, moist chocolate cake with a burst of thick, hot liquid chocole inside", "price":"LKR 300", "place": "Royal Bakery","distanc": "0.5km"]),
        Food(dictionary: ["name":"Seafood Dirty Rice", "description": "Shrimp, Scallions, green onions, Crab meat, Thyme, White pepper, Garlic, Celery, Green bell peppers", "price":"LKR 950", "place": "Sen-Saal","distanc": "0.5km"])
        ] {
        didSet {
            TableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBAction func LogoutTapped(_ sender: Any) {
        signout()
    }
}

extension ResturantViewController: UITableViewDelegate {
    func tableView(_ TableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tap on \(indexPath.row)")
    }
}

extension ResturantViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "FOOD_CELL", for: indexPath) as! RestaurantTableViewCell
        cell.foodName.text = foods[indexPath.row].name
        cell.foodDescription.text = foods[indexPath.row].description
        cell.foodPlace.text = foods[indexPath.row].place
        cell.foodPrice.text = foods[indexPath.row].price
        cell.locationLabel.text = foods[indexPath.row].distanc
        return cell 
    }
}

func signout(){
    do{
        try Auth.auth().signOut()
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryboard.instantiateViewController(identifier: "OnBoardingViewController") as? ViewController
        vc?.modalPresentationStyle = .overCurrentContext
        //self.present(vc, animated: true, completion: nil)
    }
    catch{
        print("DEBUG: sign out error")
    }
}
