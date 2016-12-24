//
//  UILabel-AnimationNumberLabel.swift
//  iSolarCloudDBO
//
//  Created by kjlink on 2016/12/6.
//  Copyright © 2016年 kjlink. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// 获取时长
    ///
    /// - Parameter num: 数字
    /// - Returns: 返回显示时间
    func getTimeDurationFromNum(num: Double) -> Double {
        if num <= 0 {
            return 0
        } else if num < 1000 {
            return 1
        } else if num < 2000 {
            return num / 1000
        } else {
            return 1
        }
    }
    
    func animation(_ fromNum: Double, toNum: Double, duration: Double) -> Void {
        self.text = String(format: "%0.2f", fromNum)
        let totalCountInt = self.getCountFromNum(num: fabs(toNum - fromNum))
        let totalCount = Double(totalCountInt)
        let delayTime = duration / totalCount
        var mediumNumArr: [String] = [String]()
        for i in 0..<Int(totalCount) {
            if (toNum - fromNum) > 0 {
                mediumNumArr.append(String(format: "%.2f", Double(i) * ((toNum-fromNum)/totalCount)+fromNum))
            } else {
                mediumNumArr.append(String(format: "%.2f", fromNum - Double(i) * ((fromNum - toNum) / totalCount)))
            }
            if i == Int(totalCount) - 1 {
                mediumNumArr.append(String(format: "%.2f", toNum))
            }
        }
        changeLabelTitle(delayTime, mediumArr: &mediumNumArr)
    }
    
    /// 得到分割数目
    ///
    /// - Parameter num: 数字
    /// - Returns: 分割数目
    func getCountFromNum(num: Double) -> Int {
        if num <= 0 {
            return 1
        } else if num < 1000 {
            return 100
        } else {
            return Int(num / 20)
        }
    }
    
    func changeLabelTitle(_ delayTime: Double, mediumArr: inout [String]) {
        if mediumArr.count <= 0 {
        } else {
            self.text = mediumArr.first
            mediumArr.remove(at: 0)
            var temp = mediumArr
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: {
                self.changeLabelTitle(delayTime, mediumArr: &temp)
            })
        }
    }
    
    func stopRuning() {
    
    }
}
