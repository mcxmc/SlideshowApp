//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐藤 節夏 on 2018/07/23.
//  Copyright © 2018年 mcxmc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    // バンドルした画像ファイルを読み込み
    let imageNames = ["dog.jpg", "dog2.jpg", "dog3.png", "dog4.jpg", "dog5.jpg"]
    var index = 0
    var isPlay = false
    var timer: Timer?
    
    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @objc func updateTimer() {
        index += 1
        if index > imageNames.count - 1 {
            index = 0
        }
        let imageName = imageNames[index]
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func playOrPause(_ sender: Any) {
        if timer != nil {
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playButton.setTitle("再生", for: .normal)
            self.timer?.invalidate()
            self.timer = nil
        } else {
            nextButton.isEnabled = false
            backButton.isEnabled = false
            playButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.photo = imageView.image
        self.timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Image Viewに画像を設定
        let imageName = imageNames[index]
        imageView.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: Any) {
        index += 1
        if index > imageNames.count - 1 {
            index = 0
        }
        let imageName = imageNames[index]
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func back(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = imageNames.count - 1
        }
        let imageName = imageNames[index]
        imageView.image = UIImage(named: imageName)
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        if timer != nil {
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playButton.setTitle("再生", for: .normal)
            self.timer?.invalidate()
            self.timer = nil
        }
    }

}

