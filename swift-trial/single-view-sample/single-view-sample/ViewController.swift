//
//  ViewController.swift
//  single-view-sample
//
//  Created by 河端　洋人 on 2017/06/08.
//  Copyright © 2017年 河端　洋人. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // 画像ファイルを読み込み
        let image = UIImage(named: "swift_logo.png")
        // ImageView に画像を設定
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var test: UILabel!

    @IBAction func soundButton(_ sender: UIButton) {
        test.text = "hoge"
        AudioServicesPlaySystemSoundWithCompletion(1000){}
    }
    
    @IBAction func customSoundButton(_ sender: Any) {
        /*
        let soundUrl = Bundle.main.url(forResource: "swords01", withExtension: "mp3")
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
        AudioServicesPlaySystemSoundWithCompletion(soundId){}
         */
        SoundUtil.playSwordConflictSound()
    }
    
    @IBAction func vibrationButton(_ sender: Any) {
        /*
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate){}
         */
        SoundUtil.vibrate()
    }
    
}
