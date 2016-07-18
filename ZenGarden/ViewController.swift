//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shrubYConstraint = NSLayoutConstraint()
    var shrubXConstraint = NSLayoutConstraint()
    var rockXContstraint = NSLayoutConstraint()
    var rockYConstraint = NSLayoutConstraint()
    var rakeXConstraint = NSLayoutConstraint()
    var rakeYconstraint = NSLayoutConstraint()
    var swordYConstraint = NSLayoutConstraint()
    var swordXConstraint = NSLayoutConstraint()
    
    let rake = UIImageView.init(image: UIImage.init(named: "rake"))
    let rock = UIImageView.init(image: UIImage.init(named: "rock1"))
    let swordInRock = UIImageView.init(image: UIImage.init(named: "swordinrock"))
    let shrub = UIImageView.init(image: UIImage.init(named: "shrub"))
    
    var shrubCoordinates = CGPoint()
    var rockCoordinates = CGPoint()
    var swordInRockCoordinates = CGPoint()
    var rakeCoordinates = CGPoint()
    
    
    var shrubGesture: UIPanGestureRecognizer!
    var rockGesture: UIPanGestureRecognizer!
    var rakeGesture: UIPanGestureRecognizer!
    var swordGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shrub.userInteractionEnabled = true
        rock.userInteractionEnabled = true
        swordInRock.userInteractionEnabled = true
        rake.userInteractionEnabled = true
        
        self.view.addSubview(shrub)
        
        shrub.removeConstraints(shrub.constraints)
        shrub.translatesAutoresizingMaskIntoConstraints = false
        
        shrubXConstraint = shrub.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0)
        
        shrubXConstraint.active = true
        shrubYConstraint = shrub.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: 0)
        shrubYConstraint.active = true
        shrub.heightAnchor.constraintEqualToConstant(150).active = true
        shrub.widthAnchor.constraintEqualToConstant(150).active = true
        
        self.view.addSubview(rake)
        
        rake.removeConstraints(rake.constraints)
        rake.translatesAutoresizingMaskIntoConstraints = false
        
        rakeXConstraint = rake.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0)
        rakeXConstraint.active = true
        rakeYconstraint = rake.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant:150)
        rakeYconstraint.active = true
        rake.heightAnchor.constraintEqualToConstant(150).active = true
        rake.widthAnchor.constraintEqualToConstant(150).active = true
        
        self.view.addSubview(rock)
        
        rock.removeConstraints(rock.constraints)
        rock.translatesAutoresizingMaskIntoConstraints = false
        
        rockXContstraint = rock.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0)
        rockXContstraint.active = true
        rockYConstraint = rock.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant:-150)
        rockYConstraint.active = true
        rock.heightAnchor.constraintEqualToConstant(150).active = true
        rock.widthAnchor.constraintEqualToConstant(150).active = true
        
        self.view.addSubview(swordInRock)
        
        swordInRock.removeConstraints(swordInRock.constraints)
        swordInRock.translatesAutoresizingMaskIntoConstraints = false
        
        swordXConstraint = swordInRock.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0)
        swordXConstraint.active = true
        swordYConstraint = swordInRock.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant:-300)
        swordYConstraint.active = true
        swordInRock.heightAnchor.constraintEqualToConstant(150).active = true
        swordInRock.widthAnchor.constraintEqualToConstant(150).active = true
        
        
        shrubGesture = UIPanGestureRecognizer.init(target: self, action: #selector(dragShrub))
        
        shrub.addGestureRecognizer(shrubGesture)
        
        rockGesture = UIPanGestureRecognizer.init(target: self, action: #selector(dragRock))
        
        rock.addGestureRecognizer(rockGesture)
        
        rakeGesture = UIPanGestureRecognizer.init(target: self, action: #selector(dragRake))
        
        rake.addGestureRecognizer(rakeGesture)
        
        swordGesture = UIPanGestureRecognizer.init(target: self, action: #selector(dragSword))
        
        swordInRock.addGestureRecognizer(swordGesture)
        
        
        
        
    }
    
    func dragShrub(recognizer: UIPanGestureRecognizer) {
        
        let coordinates = shrubGesture.translationInView(shrub)
        
        if shrubGesture.state == .Began{
            
            
            self.shrubCoordinates = coordinates
            
            
        } else {
            
            let diffY = coordinates.y - shrubCoordinates.y
            let diffX = coordinates.x - shrubCoordinates.x
            
            self.shrubYConstraint.constant += diffY
            self.shrubXConstraint.constant += diffX
            
            shrubCoordinates = coordinates
        }
        
        checkForWin()
        
    }
    
    
    func dragRock(recognizer: UIPanGestureRecognizer) {
        
        let coordinates = rockGesture.translationInView(rock)
        
        if rockGesture.state == .Began{
            
            self.rockCoordinates = coordinates
            
            
        } else {
            
            let diffY = coordinates.y - rockCoordinates.y
            let diffX = coordinates.x - rockCoordinates.x
            
            self.rockYConstraint.constant += diffY
            self.rockXContstraint.constant += diffX
            
            rockCoordinates = coordinates
        }
        
        checkForWin()
        
    }
    
    func dragRake(recognizer: UIPanGestureRecognizer) {
        
        let coordinates = rakeGesture.translationInView(rake)
        
        if rakeGesture.state == .Began {
            
            self.rakeCoordinates = coordinates
            
        } else {
            
            let diffY = coordinates.y - rakeCoordinates.y
            let diffX = coordinates.x - rakeCoordinates.x
            
            self.rakeYconstraint.constant += diffY
            self.rakeXConstraint.constant += diffX
            
            rakeCoordinates = coordinates
            
        }
        
        checkForWin()
        
    }
    
    func dragSword(recognizer: UIPanGestureRecognizer) {
        
        let coordinates = swordGesture.translationInView(swordInRock)
        
        if swordGesture.state == .Began {
            
            swordInRockCoordinates = coordinates
            
        } else {
            
            let diffY = coordinates.y - swordInRockCoordinates.y
            let diffX = coordinates.x - swordInRockCoordinates.x
            
            swordYConstraint.constant += diffY
            swordXConstraint.constant += diffX
            
            swordInRockCoordinates = coordinates
            
        }
        
       checkForWin()
        
    }
    
    func checkForWin() {
        
        let bottomRightCorner = CGPointMake(CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame))
        let topLeftCorner = CGPointMake(CGRectGetMinY(self.view.frame), CGRectGetMinX(self.view.frame))
        
        let swordMidX = swordInRock.frame.midX
        let swordMidY = swordInRock.frame.midY
        
        let swordInBottomRight = swordMidX <= bottomRightCorner.x && swordMidX >= bottomRightCorner.x - 120 && swordMidY <= bottomRightCorner.y  && swordMidY >= bottomRightCorner.y - 120
        let swordInTopLeft = swordMidX >= topLeftCorner.x && swordMidX <= topLeftCorner.x + 120 && swordMidY >= topLeftCorner.y  && swordMidY <= topLeftCorner.y + 120
        let swordConditionsMet = swordInTopLeft || swordInBottomRight
        
        let rakeMidX = rake.frame.midX
        let rakeMidY = rake.frame.midY
        
        let shrubMidX = shrub.frame.midX
        let shrubMidY = shrub.frame.midY
        
        let shrubAndRakeAreNear = rakeMidX - shrubMidX <= 200 && rakeMidX - shrubMidX >= -200 && rakeMidY - shrubMidY <= 200 && rakeMidY - shrubMidY >= -200
        
        let rockMidY = rock.frame.midY
        
        let rockAndSwordRockOppositeY = rockMidY - swordMidY >= 300 || rockMidY - swordMidY <= -300
        
        print(rakeMidX - shrubMidX)
        
        
        print("You're looking for \(bottomRightCorner) and you're at \(swordMidX), \(swordMidY)")
        
        if swordConditionsMet && shrubAndRakeAreNear && rockAndSwordRockOppositeY {
        
       print("You've arrived")
        
    }
    
    }
}

