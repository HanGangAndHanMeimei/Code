//
//  ViewController.swift
//  NSThread-线程安全（swift）
//
//  Created by 文顶顶 on 16/4/19.
//  Copyright © 2016年 文顶顶. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //设置总票数为100张
    var totalTickets = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        //多线程访问资源加锁
        //创建三条线程分别代表售票员A、售票员B、售票员C
        let thread01 = NSThread.init(target: self, selector:Selector("saleTickect"), object: nil)
        let thread02 = NSThread.init(target: self, selector: Selector("saleTickect"), object: nil);
        let thread03 = NSThread.init(target: self, selector: Selector("saleTickect"), object: nil);

        //设置线程的名称
        thread01.name = "售票员A"
        thread02.name = "售票员B"
        thread03.name = "售票员C"

        //开启线程
        thread01.start()
        thread02.start()
        thread03.start()

    }

    //模拟售票的函数
    func saleTickect()
    {
        while(true)
        {
            //加互斥锁
            /*
            * 1）同OC中的@synchronized(self) {}
            * 2）objc_sync_enter(self)和objc_sync_exit(self)必须成对使用，把要加锁的代码放在中间
            */

            objc_sync_enter(self)

            //检查是否有余票，如果有则卖出去一张
            let temp = totalTickets
            for var i=0;i<100000;i++
            {
                //空的for循环，模拟延迟
            }

            if(temp>0)
            {
                totalTickets = temp - 1
                print("\(NSThread.currentThread().name)卖出去了一张票，还剩\(totalTickets)")
            }else
            {
                print("\(NSThread.currentThread().name)发现票已经卖完了")
                break;
            }
            
            objc_sync_exit(self)
        }
        
    }
    
}

