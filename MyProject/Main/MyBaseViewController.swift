//
//  MyBaseViewController.swift
//  MyProject
//
//  Created by Mstarc on 2017/2/20.
//  Copyright © 2017年 com.mstarc.app. All rights reserved.
//

import UIKit

class MyBaseViewController: UIViewController {
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    //自定义导航条目 - 之后设置导航条内容 统一用 navItem
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }

    //重写title的didSet方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }

    //设置导航条
    private func setupNavigationBar(){
        //添加导航条
        view.addSubview(navigationBar)
        //将item条目设置到Bar上
        navigationBar.items = [navItem]
        //设置navBar的渲染颜色
        navigationBar.barTintColor = UIColor.orange
        //设置字体的颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        //设置系统按钮文字的渲染颜色
        navigationBar.tintColor = UIColor.white
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
