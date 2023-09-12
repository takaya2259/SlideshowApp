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
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var back: UIButton!
    
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
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }
    
    // 再生・停止ボタンをタップ
    @IBAction func switchBtn(_ sender: UIButton) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        
        // 再生・停止の表示切り替え
        if var title:String = switchBtn.currentTitle {
            if title == "再生" {
                switchBtn.setTitle("停止", for: .normal)
                forward.isEnabled = false
                back.isEnabled = false
                
            } else {
                switchBtn.setTitle("再生", for: .normal)
                if self.timer != nil {
                    self.timer.invalidate()
                    self.timer = nil
                    self.timer_sec = 0
                    forward.isEnabled = true
                    back.isEnabled = true
                }
            }
        }
    }
    
    // タイマー
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec:Int = 0
    
    // タイマー用のカウント
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 1
        if self.timer_sec != 0 && self.timer_sec % 2 == 0 {
            slidePhoto()
        }
    }
    
    func slidePhoto() {
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
        var nextnum:Int = num + 1
        image.image = UIImage(named: folder[nextnum % 3])
        image.image?.accessibilityIdentifier = folder[nextnum % 3]
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
        var nextnum:Int = num - 1
        if nextnum == -1 {
            image.image = venetiaImage
            image.image?.accessibilityIdentifier = "venetia.jpg"
        } else {
            image.image = UIImage(named: folder[nextnum % 3])
            image.image?.accessibilityIdentifier = folder[nextnum % 3]
        }
    }
    
    // 画像をタップしたときに拡大画像画面へと遷移
    @IBAction func imageViewTapped(_ sender: Any) {
        performSegue(withIdentifier: "detail", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のDetailViewControllerを取得する
        let detailViewController:DetailViewController = segue.destination as! DetailViewController
        detailViewController.photoname = image.getFileName()!
    }


    @IBAction func unwind(_ segue: UIStoryboardSegue){
        // 他の画面からの遷移で戻ってきたとき
     }
}


