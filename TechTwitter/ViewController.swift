//
//  ViewController.swift
//  TechTwitter
//
//  Created by kai-munekuni on 2019/02/18.
//  Copyright © 2019年 kai-munekuni. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func performSegueToResult() {
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            let listVC = segue.destination as! ListViewController
            if !textField.text!.isEmpty {
                listVC.userName = textField.text!
            } else {
                listVC.userName = "匿名希望"
            }
        }
    }

}

