//
//  ViewController.swift
//  Word Magnets
//
//  Created by Chris Archibald on 9/20/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wordArray = ["I", "like", "to", "eat", "pizza", "my", "favorite"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        addLabels()
    }
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer){
        // get translation
        var translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        
        //add dx/dy to current label position
        
        var label = panGesture.view as! UILabel
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    }
    
    func addLabels(){
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        for word in wordArray {
            var label = UILabel()
            label.text = word
            label.font = UIFont.systemFontOfSize(32)
            
            label.sizeToFit()
            
            label.backgroundColor = UIColor.whiteColor()
            
            var intX = arc4random_uniform(UInt32(screenSize.width) - 30)
            if intX < 30 {
                intX = intX + 30
            }
            var intY = arc4random_uniform(UInt32(screenSize.height) - 30)
            if intY < 30 {
                intY = intY + 30
            }
            
            var x = CGFloat(intX)
            var y = CGFloat(intY)
            
            label.center = CGPoint(x: x, y: y)
            
            view.addSubview(label)
            
            //Pan Gesture
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

