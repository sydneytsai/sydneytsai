//
//  ViewController.swift
//  CounterApp
//
//  Created by Sydney Tsai on 6/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    var countNum = 0
    var goal = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkGoal()
        count.text = String(countNum)
    }

    @IBOutlet weak var count: UILabel!
    
    @IBAction func decrement(_ sender: Any) {
        countNum = countNum - 1
        count.text = String(countNum)
        checkGoal()
    }
    
    @IBAction func increment(_ sender: Any) {
        countNum = countNum + 1
        count.text = String(countNum)
        checkGoal()
    }
    
    @IBOutlet weak var lean: UIImageView!
    
    func checkGoal() {
        if countNum == goal {
            count.text = "LEAAAAAAN"
            lean.isHidden = false
        } else {
            lean.isHidden = true
        }
    }
}

