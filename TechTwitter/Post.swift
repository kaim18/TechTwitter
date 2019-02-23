//
//  Post.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/18.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import Foundation

class Post {
    var id: String!
    var name: String!
    var content: String!
    init (id: String, name: String, content: String){
        self.id = id
        self.name = name
        self.content = content
    }
}
