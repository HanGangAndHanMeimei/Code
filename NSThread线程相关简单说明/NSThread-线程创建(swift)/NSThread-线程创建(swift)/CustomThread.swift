//
//  CustomThread.swift
//  多线程相关Code(swift)
//
//  Created by 文顶顶 on 16/4/19.
//  Copyright © 2016年 文顶顶. All rights reserved.
//

import UIKit

class CustomThread: NSThread {

    override func main() {

        //获得当前线程对象
        let currentThread = NSThread.currentThread()

        //打印字符串main和当前线程
        print("main---\(currentThread)")
    }
}
