//
//  ViewController.swift
//  EAIntroViewSample
//
//  Created by Masuhara on 2019/06/10.
//  Copyright © 2019 Ylab Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkFirstLaunch()
    }
    
    func checkFirstLaunch() {
        let ud = UserDefaults.standard
        let isFirstLaunch = ud.bool(forKey: "isLaunched")
        if isFirstLaunch == true {
            print("2回目以降の起動")
        } else {
            print("初回起動")
            let storyboard = UIStoryboard(name: "Intro", bundle: Bundle.main)
            let introViewController = storyboard.instantiateInitialViewController() as! IntroViewController
            self.present(introViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func resetApp() {
        // 起動記録を削除
        let ud = UserDefaults.standard
        ud.set(false, forKey: "isLaunched")
        
        // 本来アプリには入れてはいけないコードだが、起動時に初回起動にするため強制終了
        exit(0)
    }
    
}

