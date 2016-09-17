//
//  ViewController.swift
//  SlideshowApp
//
//  Created by MASATO YOSHIDA on 2016/09/10.
//  Copyright © 2016年 ThanksThankyou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    // 画像の名前の配列
    let imageNameArray = [
        "Pic1.jpg",
        "Pic2.jpg",
        "Pic3.jpg",
        "Pic4.jpg",
        "Pic5.jpg",
        "Pic6.jpg",
        ]
    
    // タイマー
    var timer: NSTimer?
    
    // 表示している画像の番号（初期化）
    var dispImageNo = 0
    
    @IBAction func back(sender: AnyObject) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func forward(sender: AnyObject) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 5
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 5 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出す
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込む
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    // 再生ボタンを押した時のアクション
    @IBAction func play(sender: AnyObject) {
        
        if timer == nil {
            
            // timerが作られていないので、スライドショーは実行中ではない
            // timerの実行、ボタンを停止に変更、進むと戻るを無効にする
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector:#selector(ViewController.nextPage), userInfo: nil, repeats: true)
            showBtn.setTitle("停止", forState: UIControlState.Normal)
            forwardBtn.enabled = false
            backBtn.enabled = false
            
        } else {
            
            // timerが作られているので、スライドショー実行中
            // timerの停止、ボタンを再生に変更、進むと戻るを有効にする
            timer!.invalidate()
            timer = nil
            showBtn.setTitle("再生", forState: UIControlState.Normal)
            forwardBtn.enabled = true
            backBtn.enabled = true
        }
    }

    // NSTimer実行中に画像を切り替えて行く関数
    func nextPage() {
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "Pic1.jpg")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // セグエの遷移先からxを取得し現在表示している画像のdispImageNoを代入する
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // segueから遷移先のEnlargedViewControllerを取得する
        let enlargedViewController:EnlargedViewController = segue.destinationViewController as! EnlargedViewController
        // 遷移先のEnlargedViewControllerで宣言しているxに値を代入して渡す
        enlargedViewController.x = dispImageNo
    }

    @IBAction func onTapImage(sender: AnyObject) {
        // セグエを使用して画面を遷移
        performSegueWithIdentifier("enlarge", sender: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
}