//
//  TodoModel.swift
//  todo
//
//  Created by Jewel on 16/5/29.
//  Copyright © 2016年 Jewel. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var topic:String;
    var remark:String;
    var color:String;
    var date:NSDate;
    
    init(topic:String,remark:String,color:String,date:NSDate) {

        self.topic = topic;
        self.remark = remark;
        self.color = color;
        self.date = date;
    }
}
