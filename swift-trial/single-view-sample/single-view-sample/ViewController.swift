//
//  ViewController.swift
//  single-view-sample
//
//  Created by 河端　洋人 on 2017/06/08.
//  Copyright © 2017年 河端　洋人. All rights reserved.
//

import UIKit

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


}

