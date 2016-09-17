//
//  EnlargedViewController.swift
//  SlideshowApp
//
//  Created by MASATO YOSHIDA on 2016/09/11.
//  Copyright © 2016年 ThanksThankyou. All rights reserved.
//

import UIKit

class EnlargedViewController: UIViewController {

    @IBOutlet weak var EnlargedImage: UIImageView!
    
    // 受け取るためのプロパティ（変数を宣言しておく）
    var x: Int = 0
    
    let imageNameArray = [
        "Pic1.jpg",
        "Pic2.jpg",
        "Pic3.jpg",
        "Pic4.jpg",
        "Pic5.jpg",
        "Pic6.jpg",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // nameにimageNameArray配列の番号を手掛かりに画像名を取り出す
        let name = imageNameArray[x]
        
        // 画像名から画像を読み込む
        let image = UIImage(named: name)
        
        // EnlargedImageという名のImageViewに画像をセット
        EnlargedImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
