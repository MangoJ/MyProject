//
//  MyNavViewController.swift
//  MyProject
//
//  Created by Mstarc on 2017/2/20.
//  Copyright © 2017年 com.mstarc.app. All rights reserved.
//

import UIKit

class MyNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏navgationBar
        navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }


     override func pushViewController(_ viewController: UIViewController, animated: Bool) {
         //如果不是栈底控制器才会隐藏
        if childViewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
            //判断控制器的级数
            if childViewControllers.count == 1 {
                //级数为1时显示的是首页的标题否则显示 "返回"
                title = childViewControllers.first?.title ?? "返回"

            }
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(popback))

        }
        super.pushViewController(viewController, animated: true)
    }
    
    //返回上一级
    @objc private func popback(){
        popViewController(animated: true)
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
