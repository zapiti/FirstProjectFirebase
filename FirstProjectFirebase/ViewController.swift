//
//  ViewController.swift
//  FirstProjectFirebase
//
//  Created by Nathan Ranghel on 20/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import UIKit
import FirebaseFirestore


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        let db = Firestore.firestore()
        
        db.collection("users").addDocument(data: ["name" : "fred"])
        db.collection("users").whereField("name", isEqualTo: "nathan").getDocuments{(snapshot,error) in
            if error != nil{
                print(error as Any)
            }else{
                for document in (snapshot?.documents)! {
                    
                    if let name = document.data()["name"] as? String {
                        print(name)
                    }
                    
                }
            }
        }
        
    }


}

