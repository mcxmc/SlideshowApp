//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 佐藤 節夏 on 2018/07/24.
//  Copyright © 2018年 mcxmc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var photo: UIImage!
    
    @IBOutlet weak var imageBig: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageBig.image = photo
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
