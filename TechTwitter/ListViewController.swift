//
//  ListViewController.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/18.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import UIKit
import FirebaseFirestore
class ListViewController: UIViewController{
    let db = Firestore.firestore()
    var postArray: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    @IBAction func add(){
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        updateStore()
    }
    func updateStore(){
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data()["first"])")
                    print("\(document.data())")
                //    postArray.append(Post(id: document.documentID, name: document.data(), content: document.data.content))
                }
            }
        }
    }
    
    

}
