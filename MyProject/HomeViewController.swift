//
//  HomeViewController.swift
//  MyProject
//
//  Created by Mstarc on 2017/2/20.
//  Copyright © 2017年 com.mstarc.app. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildController()
    }

    //MARK:方案1
    //设置所有控制器
    func setupChildController()  {

        addChildViewController(HomePageViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_home")
        addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_home")
        addChildViewController(ProfileViewController(), title: "我的", imageName: "tabbar_home")

    }
//重载下列方法
    /** 方法的重载:方法名称相同,但是参数不同. --> 1.参数的类型不同 2.参数的个数不同
            private在当前文件中可以访问,但是其他文件不能访问
     */
    private func addChildViewController(_ childController: UIViewController,title : String, imageName : String) {
        // 1.设置子控制器的属性
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
        //2.设置导航栏控制器
        let childNaVc  = UINavigationController(rootViewController: childController)
        addChildViewController(childNaVc)

    }

    //MARK:方案2
    func setupChildViewCotroller()  {
        let array = [
            ["clsName":"HomePageViewController","title":"首页","iamgeName":"home"],
             ["clsName":"MessageViewController","title":"首页","iamgeName":"home"],
             ["clsName":"DiscoverViewController","title":"首页","iamgeName":"home"],
             ["clsName":"ProfileViewController","title":"首页","iamgeName":"home"]
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controllers(dict: dict))
        }

        viewControllers = arrayM

    }

    /// 使用字典创建一个子控制器
    ///
    /// - parameter dict: 信息字典[clsName,title,imageName]
    /// - returns 子控制器

    private func controllers(dict:[String:String])->UIViewController{
         //1.取得字典内容
        let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        guard let clsName = dict["clsName"],let title = dict["title"],let imageName = dict["imageName"],let cls = NSClassFromString(bundleName + "." + clsName)as? UIViewController.Type else {
            return UIViewController()
        }
        //2.创建视图控制器
        let vc = cls.init()
        vc.title = title
        let  nav = UINavigationController(rootViewController: vc)
        //3.设置tabbar 图像
        vc.tabBarItem.image = UIImage(named: "tabbar_"+imageName)
        //withRenderingMode(.alwaysOriginal)颜色渲染
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_"+imageName+"_highlighted")?.withRenderingMode(.alwaysOriginal)
        //4.设置tabbar的标题字体颜色(如果不设置图片字体颜色无效果)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        return nav
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
