//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by 石森貴也 on 2023/09/08.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var photoname:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: photoname)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
