//: Playground - noun: a place where people can play

import UIKit

/*
变量和常量的定义：
变量：var
常量：let
格式：修饰符（var|let） 变量|常量名称：数据类型 = 值
*/

var numberA:Int = 10   //定义变量并初始化
numberA = 20           //变量的数值可以修改

let numberB:Int = 20    //定义常量并初始化
//numberB = 20          // 常量的数据不可以修改


/*
类型推导
swift具备类型推导，即在定义变量|常量并进行初始化的时候可以不用明确指定数据类型，能够自动的根据值推导出正确的数据类型
说明：应该尽可能的使用自动类型推导功能，除非1）需要明确指定数据长度2）定义的时候不进行初始化工作
*/

let number1 = 10
let number2 = 10.1

/*
类型转换
在OC语言中可以进行显式的类型转换和隐式的类型转换
在swift语言中没有隐式的类型转换，只运行相同数据类型的数据进行赋值和运算
*/

//1)赋值操作
let number3:Int  = Int(10.1)    //不同数据类型的数据不允许赋值


//2)运算
let number4 = 10
let number5 = 88.8
let number6 = Double(number4) + number5


/*
元组:复合数据类型
定义：常量|变量修饰符 常量|变量的名称：（数据类型1，数据类型2，数据类型3）=（值1，值2，值3）
*/

//定义并初始化元组
let person:(String,Int,Double) = ("wendingding",21,99.9)
//提取元组的内容
person.0
person.1
person.2

//给元组的元素设置名称
let personB = (name:"wendingding",age:21,score:99.9)
//提取元组的内容
personB.name
personB.age
personB.score


//提取元组数据
let (name,age,score) = ("wendingding",21,99)
name
age
score
