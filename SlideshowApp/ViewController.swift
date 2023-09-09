//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 石森貴也 on 2023/09/08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchBtn.setTitle("再生", for: .normal)
    }
    
    @IBOutlet weak var switchBtn: UIButton!
    
    @IBAction func switchBtn(_ sender: UIButton) {
        if var title = switchBtn.currentTitle {
            if title == "再生" {
                switchBtn.setTitle("停止", for: .normal)
            } else {
                switchBtn.setTitle("再生", for: .normal)
            }
        } else {
            print("nilです")
        }
    }
    
    
    
}

