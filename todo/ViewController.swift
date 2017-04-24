//
//  ViewController.swift
//  todo
//
//  Created by Jewel on 16/5/29.
//  Copyright © 2016年 Jewel. All rights reserved.
//

import UIKit
var todos:[TodoModel] = []

func dateFromString(datestr:String)->NSDate{
    let dateFormatter = NSDateFormatter();
    dateFormatter.dateFormat = "yyyy-MM-dd";
    let date = dateFormatter.dateFromString(datestr);
    return date!;
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var colorBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [TodoModel(topic: "dating",remark: "with Jandy",color:"red",date:dateFromString("2016-6-7")),
        TodoModel(topic: "dating",remark: "with Jewel",color:"blue",date:dateFromString("2016-6-7")),
        TodoModel(topic: "dating",remark: "with HAHA",color:"orange",date:dateFromString("2016-6-7"))]
        
        navigationItem.leftBarButtonItem = editButtonItem();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    protocal for UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell;
        var todo = todos[indexPath.row] as TodoModel;
        var date = cell.viewWithTag(3) as! UILabel;
        var topic = cell.viewWithTag(1) as! UILabel;
        var remark = cell.viewWithTag(2) as! UILabel;
//        var btn = cell.viewWithTag(0) as! UIButton;
        
      
        topic.text = todo.topic;
        remark.text = todo.remark;
        
        var red:CGFloat = 1;
        var green:CGFloat = 1;
        var blue:CGFloat = 1;
        cell.viewWithTag(100)?.layer.cornerRadius = 10;
        if todo.color == "red"{
            red = 208/255;
            green = 2/255;
            blue = 27/255;
        }
        if todo.color == "purple"{
            red = 189/255;
            green = 16/255;
            blue = 224/255;
        }
        if todo.color == "blue"{
            red = 74/255;
            green = 144/255;
            blue = 226/255;
        }
        if todo.color == "orange"{
            red = 245/255;
            green = 166/255;
            blue = 35/255;
        }
        
        cell.viewWithTag(100)?.backgroundColor = UIColor(red:red,green:green,blue:blue,alpha:1.0);
        
        let locale = NSLocale.currentLocale();
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale);
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = dateFormat;
        date.text = dateFormatter.stringFromDate(todo.date);
        
        return cell;
    }
    
//    protocal for UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row);
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left);
        }
    }

//    editting mode
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated);
        self.tableView.setEditing(editing, animated: animated);
    }
    @IBAction func close(segue:UIStoryboardSegue){
        print("Close");
        tableView.reloadData();
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="EditTodo" {
            var vc = segue.destinationViewController as! AddEventViewController;
            var indexPath = tableView.indexPathForSelectedRow;
            if let index = indexPath {
                vc.todo = todos[index.row];
            }
        }
    }
}

