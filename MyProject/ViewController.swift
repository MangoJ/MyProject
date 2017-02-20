//
//  ViewController.swift
//  MyProject
//
//  Created by Mstarc on 2017/2/20.
//  Copyright © 2017年 com.mstarc.app. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let pushBtn = UIButton(type: .system)
        pushBtn.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        pushBtn.center = self.view.center
        pushBtn.setTitle("下一页", for: .normal)
        pushBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        self.view.addSubview(pushBtn)
    }
    
    //进入下一页(主要查看navigtionItem的显示)
    func nextPage()  {
        let Vc = ViewController()
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

