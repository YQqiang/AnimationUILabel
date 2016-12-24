# AnimationUILabel
# 说明
该版本为Swift版本 ,原文在这[OC版本](https://github.com/ScottZg/AnimationNumLabel)
# 效果展示
![数字减小](https://github.com/YQqiang/AnimationUILabel/blob/master/%E6%95%B0%E5%AD%97%E5%87%8F%E5%B0%8F.gif)
![数字增长](https://github.com/YQqiang/AnimationUILabel/blob/master/%E6%95%B0%E5%AD%97%E5%A2%9E%E9%95%BF.gif)
# 主要代码

```
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
```
# 使用方法

```
animationLabel.stopRuning()
animationLabel.animation(start, toNum: end, duration: animationLabel.getTimeDurationFromNum(num: fabs(end)))
```
# 写在最后 本人iOS开发菜鸟一枚,不妥之处欢迎大神指教~~~~
简书地址[逆行云](http://www.jianshu.com/users/b34eb8288906/latest_articles)欢迎关注


