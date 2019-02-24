//
//  ListViewModel.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/24.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ListViewModel{
    let db = Firestore.firestore()
    func create(post: Post, callBack: @escaping () -> ()) {
        db.collection("Posts").addDocument(data: [
            "name": post.name,
            "content": post.content
        ]){ error in
            if error == nil {
                callBack()
            }
        }
    }
    
    func read(callBack: @escaping ([Post]) -> ()) {
        
        db.collection("Posts").addSnapshotListener { (snapShots, error) in
            if error != nil { return }
            guard let _snapShots = snapShots else { return }
            
            var postArray: [Post] = []
            
            _snapShots.documents.forEach({ (doc) in
                
                let post = Post()
                post.name = doc.data()["name"] as? String
                post.content = (doc.data()["content"] as! String)
                postArray.append(post)
            })
            
            callBack(postArray)
        }
    }
}
