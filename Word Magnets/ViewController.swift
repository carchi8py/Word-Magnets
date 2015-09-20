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
            
            //Pan Gesture
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
        }
    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer){
        // get translation
        var translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        
        //add dx/dy to current label position
        
        var label = panGesture.view as! UILabel
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

