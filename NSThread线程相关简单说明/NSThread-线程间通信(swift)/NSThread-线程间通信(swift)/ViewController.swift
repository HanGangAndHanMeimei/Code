//
//  ViewController.swift
//  NSThread-线程间通信(swift)
//
//  Created by 文顶顶 on 16/4/19.
//  Copyright © 2016年 文顶顶. All rights reserved.
//

import UIKit

//！！！注意，该案例内部下载图片，发送了http请求需要修改info.plist文件
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //程序启动后开子线程下载图片，图片下载完成之后回到主线程设置图片
         NSThread.detachNewThreadSelector(Selector("downloadImage"), toTarget: self, withObject: nil)
    }

    func downloadImage()
    {
        //1.获得要下载图片的url
        let url = NSURL.init(string: "http://p9.qhimg.com/t014d1bd470cb60ac6e.jpg")

        //2.把url地址指向资源的二进制下载到本地
        let imageData = NSData.init(contentsOfURL: url!)

        //3.把二进制数据转换为图片
        let image = UIImage.init(data: imageData!);

        //4.打印查看当前线程（应该是在子线程中下载图片）
        print("当前线程为\(NSThread.currentThread())")

        //5.线程间通信
        //方法一
        self.performSelectorOnMainThread(Selector("showImage:"), withObject: image, waitUntilDone:true)
        //方法二
        //imageView.performSelectorOnMainThread(Selector("setImage:"), withObject: image, waitUntilDone:true)
    }

    
    func showImage(image:UIImage)
    {
        //设置图片
        imageView.image = image

        //打印查看设置图片操作的线程
        print("处理UI刷新操作的线程\(NSThread.currentThread())")

    }
}

