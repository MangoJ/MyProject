//
//  HomePageViewController.swift
//  MyProject
//
//  Created by Mstarc on 2017/2/20.
//  Copyright © 2017年 com.mstarc.app. All rights reserved.
//

import UIKit

class HomePageViewController: MyBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let pushBtn = UIButton(type: .system)
        pushBtn.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        pushBtn.center = self.view.center
        pushBtn.setTitle("下一页", for: .normal)
        pushBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        self.view.addSubview(pushBtn)

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
