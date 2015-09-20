//
//  ViewController.swift
//  Word Magnets
//
//  Created by Chris Archibald on 9/20/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var wordArray = ["I", "like", "to", "eat", "pizza", "my", "favorite"]
        
        for word in wordArray {
            var label = UILabel()
            label.text = word
            label.font = UIFont.systemFontOfSize(32)
            
            label.sizeToFit()
            
            label.backgroundColor = UIColor.whiteColor()
            
            var x = CGFloat(arc4random_uniform(300))
            var y = CGFloat(arc4random_uniform(450))
            
            label.center = CGPoint(x: x, y: y)
            
            view.addSubview(label)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

