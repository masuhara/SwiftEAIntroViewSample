//
//  IntroViewController.swift
//  EAIntroViewSample
//
//  Created by Masuhara on 2019/06/10.
//  Copyright © 2019 Ylab Inc. All rights reserved.
//

import UIKit
import EAIntroView

class IntroViewController: UIViewController {
    
    @IBOutlet var introView: EAIntroView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setIntro()
    }
    
    func setIntro() {
        // IntroViewのアクションをハンドリングするためのdelegate設定
        introView.delegate = self
        
        // スキップボタンのデザイン
        introView.skipButton.setTitle("スキップ", for: .normal) // デフォルトでは英語のSkip
        introView.skipButton.setTitleColor(UIColor.green, for: .normal) // 文字色
        introView.skipButtonSideMargin = 16.0 // 右の余白
        
        // PageControlのデザイン
        introView.pageControl.currentPageIndicatorTintColor = UIColor.green // 選択中のページのドットの色
        introView.pageControl.pageIndicatorTintColor = UIColor.lightGray // 非選択状態のページのドットの色
        
        // 1ページ目
        let page1 = EAIntroPage()
        page1.title = "ピカチュウ"
        page1.titleColor = UIColor.yellow
        page1.desc = "でんきポケモン。サトシのあいぼう。ほっぺにでんきをためることができる。"
        page1.descColor = UIColor.yellow
        page1.titleIconView = UIImageView(image: UIImage(named: "pikachu.png"))
        
        // 2ページ目
        let page2 = EAIntroPage()
        page2.title = "ヒトカゲ"
        page2.titleColor = UIColor.red
        page2.desc = "ほのおポケモン。しんかするとリザード、リザードンになる。しっぽのほのおがきえるとしぬ。"
        page2.descColor = UIColor.red
        page2.titleIconView = UIImageView(image: UIImage(named: "hitokage.png"))

        introView.pages = [page1, page2]
    }
}

extension IntroViewController: EAIntroDelegate {
    func introDidFinish(_ introView: EAIntroView!, wasSkipped: Bool) {
        if wasSkipped == true {
            print("Intro skipped")
            let ud = UserDefaults.standard
            ud.set(true, forKey: "isLaunched")
            ud.synchronize()
            
            self.dismiss(animated: false, completion: nil)
        } else {
            print("Intro finished")
            let ud = UserDefaults.standard
            ud.synchronize()
            
            ud.set(true, forKey: "isLaunched")
            self.dismiss(animated: false, completion: nil)
        }
    }
}
