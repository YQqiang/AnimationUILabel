//
//  ViewController.swift
//  AnimationNumberLabelDemo
//
//  Created by sungrow on 2016/12/24.
//  Copyright © 2016年 sungrow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- 控件属性
    @IBOutlet weak var startNum: UITextField!
    @IBOutlet weak var endNum: UITextField!
    @IBOutlet weak var animationLabel: UILabel!
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        startNum.leftViewMode = .always
        let startLeftView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
        startLeftView.textColor = UIColor.black
        startLeftView.text = "开始数字:"
        startNum.leftView = startLeftView
        
        endNum.leftViewMode = .always
        let endLeftView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
        endLeftView.textColor = UIColor.black
        endLeftView.text = "结束数字:"
        endNum.leftView = endLeftView
    }
}

// MARK:- 事件监听
extension ViewController {
    
    @IBAction func startAnimationAction(_ sender: UIButton) {
        var start = 0.0
        var end = 0.0
        if let startStr = startNum.text, let tempStart = Double(startStr) {
            start = tempStart
        }
        
        if let endStr = endNum.text, let tempEnd = Double(endStr) {
            end = tempEnd
        }
        
        animationLabel.stopRuning()
        animationLabel.animation(start, toNum: end, duration: animationLabel.getTimeDurationFromNum(num: fabs(end)))
        
        print("-----\(start)----\(end)")
    }
}

