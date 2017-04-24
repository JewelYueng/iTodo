//
//  AddEventViewController.swift
//  todo
//
//  Created by Jewel on 16/5/29.
//  Copyright © 2016年 Jewel. All rights reserved.
//

import UIKit
import QuartzCore

class AddEventViewController: UIViewController,UITextFieldDelegate{
    //    声明变量
    
    var topicLabel:UILabel!
    var remarkLabel:UILabel!
    var topicText:UITextField?
    var remarkText:UITextField?
   
    //    声明四个按钮
    var redButton:UIButton?
    var orangeButton:UIButton?
    var blueButton:UIButton?
    var purpleButton:UIButton?
    var todo:TodoModel?;
    
    var btn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var red:CGFloat = 1;
        var green:CGFloat = 1;
        var blue:CGFloat = 1;
        
        //        完成按钮的实现
//        let finshedEidt = UIButton(type:UIButtonType.RoundedRect);
//        finshedEidt.frame = CGRectMake(260,25,50,30);
//        finshedEidt.setTitle("完成",forState:UIControlState.Normal);
//        finshedEidt.addTarget(self,action:#selector(AddEventViewController.finshedEdit),forControlEvents:UIControlEvents.TouchUpInside);
//        finshedEidt.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: finshedEidt);
        // Do any additional setup after loading the view, typically from a nib.
        //        视图内容
        topicLabel = UILabel();
        topicLabel?.frame = CGRectMake(24, 83, 50, 30);
        self.topicLabel?.text = "主题";
        self.topicLabel.textColor = UIColor.darkGrayColor();
        self.view.addSubview(topicLabel);
        
        self.topicText = UITextField(frame: CGRectMake(74,83,230,30));
        topicText?.delegate = self;
        self.topicText!.borderStyle = UITextBorderStyle.RoundedRect;
        self.topicText?.placeholder = "输入主题";
        self.topicText?.borderStyle =  UITextBorderStyle.None;
        self.view.addSubview(topicText!);
        
        remarkLabel = UILabel();
        remarkLabel?.frame = CGRectMake(24, 120, 50, 30);
        self.remarkLabel?.text = "备注";
        self.remarkLabel.textColor = UIColor.darkGrayColor()
        self.view.addSubview(remarkLabel!)
        
        self.remarkText = UITextField(frame: CGRectMake(74,120,230,30));
        remarkText?.delegate = self;
        self.remarkText!.borderStyle = UITextBorderStyle.RoundedRect;
        self.remarkText?.placeholder = "输入备注";
        self.remarkText?.borderStyle = UITextBorderStyle.None;
        self.view.addSubview(remarkText!);
        //        两条下划线
        let lineUnderTopicFrame=CGRectMake(20, 115, 285, 1);//在指定位置（0，0）创建一个宽为100，高为100的视图。
        let lineUnderTopic = UIView(frame:lineUnderTopicFrame);//初始化视图
        lineUnderTopic.backgroundColor=UIColor.grayColor();//设置视图的背景颜色
        self.view?.addSubview(lineUnderTopic);//在窗口内添加子视图
        
        let lineUnderRemarkFrame=CGRectMake(20, 152, 285, 1);//在指定位置（0，0）创建一个宽为100，高为100的视图。
        let lineUnderRemark = UIView(frame:lineUnderRemarkFrame);//初始化视图
        lineUnderRemark.backgroundColor=UIColor.grayColor();//设置视图的背景颜色
        self.view?.addSubview(lineUnderRemark);//在窗口内添加子视图
        //        四个颜色标识
        red = 189/255;
        green = 16/255;
        blue = 224/255;
        let purpleFrame = CGRectMake(280, 160, 14, 14);
        let purpleButton = UIButton(frame: purpleFrame);
        purpleButton.layer.cornerRadius = 7;
        purpleButton.backgroundColor = UIColor(red:red,green:green,blue:blue,alpha:1.0);
        purpleButton.showsTouchWhenHighlighted = true;
        purpleButton.addTarget(self, action: #selector(AddEventViewController.clickButton), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(purpleButton);
        
        red = 74/255;
        green = 144/255;
        blue = 226/255;
        let blueFrame = CGRectMake(260, 160, 14, 14);
        let blueButton = UIButton(frame: blueFrame);
        blueButton.layer.cornerRadius = 7;
        blueButton.backgroundColor = UIColor(red:red,green:green,blue:blue,alpha:1.0);
        blueButton.showsTouchWhenHighlighted = true;
        blueButton.addTarget(self, action: #selector(AddEventViewController.clickButton), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(blueButton);
        
        red = 245/255;
        green = 166/255;
        blue = 35/255;
        let orangeFrame = CGRectMake(240, 160, 14, 14);
        let orangeButton = UIButton(frame: orangeFrame);
        orangeButton.layer.cornerRadius = 7;
        orangeButton.backgroundColor = UIColor(red:red,green:green,blue:blue,alpha:1.0);
        orangeButton.showsTouchWhenHighlighted = true;
        orangeButton.addTarget(self, action: #selector(AddEventViewController.clickButton), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(orangeButton);
        
        red = 208/255;
        green = 2/255;
        blue = 27/255;
        let redFrame = CGRectMake(220, 160, 14, 14);
        let redButton = UIButton(frame: redFrame);
        redButton.layer.cornerRadius = 7;
        redButton.backgroundColor = UIColor(red:red,green:green,blue:blue,alpha:1.0);
        redButton.showsTouchWhenHighlighted = true;
        redButton.addTarget(self, action: #selector(AddEventViewController.clickButton), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(redButton);
        
        redButton.tag = 14;
        blueButton.tag = 11;
        orangeButton.tag = 12;
        purpleButton.tag = 13;
        
//        初始化
        if todo == nil {
            navigationController?.title = "Add";
        }
        else{
            navigationController?.title = "Edit";
            topicText?.text = todo?.topic
            remarkText?.text = todo?.remark;
            if todo?.color == "red" {
                redButton.layer.borderWidth = 1;
                redButton.layer.borderColor = UIColor.whiteColor().CGColor;
                redButton.selected = true;
                btn = redButton;
            }
            if todo?.color == "purple" {
                purpleButton.layer.borderWidth = 1;
                purpleButton.layer.borderColor = UIColor.whiteColor().CGColor;
                purpleButton.selected = true;
                btn = purpleButton;
            }
            if todo?.color == "blue" {
                blueButton.layer.borderWidth = 1;
                blueButton.layer.borderColor = UIColor.whiteColor().CGColor;
                blueButton.selected = true;
                btn = blueButton;
            }
            if todo?.color == "orange" {
                orangeButton.layer.borderWidth = 1;
                orangeButton.layer.borderColor = UIColor.whiteColor().CGColor;
                orangeButton.selected = true;
                btn = orangeButton;
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //    非textField区域键盘弹回的实现
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event);
        self.view.endEditing(false);
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        var colorSelected:String?;
//        确定选择了哪种颜色的按钮
        colorSelected = "green";
        if btn.tag == 14{
            colorSelected = "red";
        }
        if btn.tag == 13{
            colorSelected = "purple";
        }
        if btn.tag == 11{
            colorSelected = "blue";
        }
        if btn.tag == 12{
            colorSelected = "orange";
        }
        
//        新建或者编辑情况下的界面初始化
        if todo == nil {
            var todo = TodoModel(topic:(topicText?.text)!,remark:(remarkText?.text)!,color:colorSelected!,date:NSDate());
            todos.append(todo);
        }
        else{
            todo?.topic = topicText!.text!;
            todo?.remark = (remarkText?.text)!;
            todo?.color = colorSelected!;
        }
        
    }

 
    func clickButton(sender:UIButton){
        if(btn != sender&&btn != nil){
            btn?.selected = false;
            btn!.layer.borderColor = btn.backgroundColor!.CGColor;
            btn = sender;
            btn?.layer.borderWidth = 1;
            btn!.layer.borderColor = UIColor.whiteColor().CGColor;
        }
        if(btn == nil){
            btn = sender;
            btn?.layer.borderWidth = 1;
            btn!.layer.borderColor = UIColor.whiteColor().CGColor;
        }
        
    }

}
