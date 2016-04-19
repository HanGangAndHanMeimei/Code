//
//  ViewController.swift
//  NSThread-线程创建(swift)
//
//  Created by 文顶顶 on 16/4/19.
//  Copyright © 2016年 文顶顶. All rights reserved.
//
import UIKit

class ViewController: UIViewController {


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        //基本方法
        //1.获得执行该方法的当前线程
        let currentThread = NSThread.currentThread()
        print("当前线程为\(currentThread)")

        //2.获得应用程序的主线程
        let mainThread = NSThread.mainThread()
        print("应用程序的主线程\(mainThread)")

        //3.判断当前线程是否是主线程
        let isMain =  NSThread.isMainThread()

        //4.创建线程来执行任务（run方法封装任务）
        //说明：NSThread有四种创建线程的方法
        createNewThreadWithNSThreadMethodFour()
    }

    //NSThread创建线程的四种方式
    func createNewThreadWithNSThreadMethodOne()
    {
        //1.创建线程
        let thread = NSThread.init(target: self, selector:Selector("run"), object: nil)

        //设置线程的名称
        thread.name = "线程A"

        //2.启动线程
        thread.start()
    }

    func createNewThreadWithNSThreadMethodTwo()
    {
        //分离出一条子线程，自动启动线程，但无法获得线程对象
        NSThread.detachNewThreadSelector(Selector("run"), toTarget: self, withObject: nil)
    }

    func createNewThreadWithNSThreadMethodThree()
    {
        //开启一条后台线程，自动启动线程，但无法获得线程对象
        self.performSelectorInBackground(Selector("run"), withObject: nil);
    }

    func createNewThreadWithNSThreadMethodFour()
    {
        //let thread =  CustomThread.init(target: self, selector:Selector("run"), object: nil)
        let thread = CustomThread();
        thread.start()
    }

    func run()
    {
        //获得当前执行run方法的线程
        let thread = NSThread.currentThread()
        print("run--\(thread.name)-\(thread)");


        //线程的退出
        NSThread.exit()
        //线程的休眠1
        NSThread.sleepForTimeInterval(2.0)
        //线程的休眠2
        NSThread.sleepUntilDate(NSDate.init(timeIntervalSinceNow: 3.0))
    }
    
}

