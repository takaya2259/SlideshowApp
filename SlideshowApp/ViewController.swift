//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 石森貴也 on 2023/09/08.
//

import UIKit

class ViewController: UIViewController {
    
    // アウトレット接続
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    // 画像
    let istanbulImage = UIImage(named: "istanbul.jpg")
    let parisImage = UIImage(named: "paris.jpg")
    let venetiaImage = UIImage(named: "venetia.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchBtn.setTitle("再生", for: .normal)
        image.image = istanbulImage
    }
    
    // 再生・停止切り替え
    @IBAction func switchBtn(_ sender: UIButton) {
        if var title:String = switchBtn.currentTitle {
            if title == "再生" {
                switchBtn.setTitle("停止", for: .normal)
            } else {
                switchBtn.setTitle("再生", for: .normal)
            }
        } else {
            print("nilです")
        }
    }
    
    // 進む
    @IBAction func forward(_ sender: UIButton) {
        let folder = [istanbulImage, parisImage, venetiaImage]
        
    }
    // 戻る
    @IBAction func back(_ sender: UIButton) {
        let folder = [istanbulImage, parisImage, venetiaImage]
        
    }
}

