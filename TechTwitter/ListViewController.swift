//
//  ListViewController.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/18.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import UIKit
import FirebaseFirestore
class ListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    let db = Firestore.firestore()
    var postArray: [Post] = []
    let model: ListViewModel  = ListViewModel()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    var userName: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userName
        model.read { (posts) in
            self.postArray = posts
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel!.text = postArray[indexPath.section].name
            return cell
    }
    @IBAction func back(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func add(){
        if textField.text!.isEmpty { return }
        let post = Post()
        post.name = "hoge"
        post.content = textField.text!

        
        model.create(post: post) {
            let alert = UIAlertController(title: "送信完了", message: "送信完了", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.textField.text = ""
            }))
            self.present(alert, animated: true, completion: nil)
        }
        updateStore()
    }
    
    
    func updateStore(){
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
//                for document in querySnapshot!.documents {
//                   self.postArray.append(Post(name:document.data()["first"] as! String, content: document.data()["last"] as! String))
//
//                }
            }
        }
        tableView.reloadData()
    }
    
    

}
