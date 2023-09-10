//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 石森貴也 on 2023/09/08.
//

import UIKit

extension UIImageView {
    func getFileName() -> String? {
        return self.image?.accessibilityIdentifier
    }
}

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
        image.image?.accessibilityIdentifier = "istanbul.jpg"
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
        let folder = ["istanbul.jpg", "paris.jpg", "venetia.jpg"]
        // 現在表示中のjpg情報
        let photoname = image.getFileName()
        
        // 現在表示中のjpg番号
        func identifier() -> Int {
            var ans:Int?
            for i in 0 ... 2 {
                if folder[i] == photoname {
                    ans = i
                } else {
                    continue
                }
            }
            return ans!
        }
        var num:Int = identifier()
        // 次表示すべき画像の番号
        var nextnum:Int = num - 1
        if nextnum == -1 {
            image.image = venetiaImage
            image.image?.accessibilityIdentifier = "venetia.jpg"
        } else {
            image.image = UIImage(named: folder[nextnum % 3])
            image.image?.accessibilityIdentifier = folder[nextnum % 3]
        }
    }
    // 戻る
    @IBAction func back(_ sender: UIButton) {
        let folder = ["istanbul.jpg", "paris.jpg", "venetia.jpg"]
        // 現在表示中のjpg情報
        let photoname = image.getFileName()
        
        // 現在表示中のjpg番号
        func identifier() -> Int {
            var ans:Int?
            for i in 0 ... 2 {
                if folder[i] == photoname {
                    ans = i
                } else {
                    continue
                }
            }
            return ans!
        }
        var num:Int = identifier()
        // 次表示すべき画像の番号
        var nextnum:Int = num + 1
        image.image = UIImage(named: folder[nextnum % 3])
        image.image?.accessibilityIdentifier = folder[nextnum % 3]
    }
}


