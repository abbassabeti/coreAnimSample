//
//  ViewController.swift
//  CoreAnimSample
//
//  Created by Abbas Sabeti on 9/13/18.
//  Copyright © 2018 Abbas Sabeti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        renderRows()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.renderCounterRows()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.renderZAxisRows()
                
            }
        }
    }
    
    func renderRows(){
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame.size = view.frame.size
        replicatorLayer.frame.size.height /= 2
        replicatorLayer.frame.size.width /= 2
        replicatorLayer.masksToBounds = true
        let imageLayer = CALayer()
        let image = UIImage(named: "tom")
        imageLayer.contents = image?.cgImage
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 2
        animation.fromValue = 1
        animation.toValue = 0.1
        animation.autoreverses = true
        animation.repeatCount = .infinity
        imageLayer.add(animation, forKey: "hypnoscale")
        if let size = image?.size{
            imageLayer.frame.size = size
            let width = size.width
            let instanceCount = view.frame.width / width
            // Shift each instance by the width of the image
            replicatorLayer.instanceCount = Int(ceil(instanceCount))
            let colorOffset = -1 / Float(replicatorLayer.instanceCount)
            replicatorLayer.instanceGreenOffset = colorOffset
            replicatorLayer.instanceRedOffset = colorOffset
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                width, 0, 0
            )
            // Reduce the red & green color component of each instance,
            // effectively making each copy more and more blue
            replicatorLayer.addSublayer(imageLayer)
            
            let verticalReplicatorLayer = CAReplicatorLayer()
            verticalReplicatorLayer.frame.size = view.frame.size
            verticalReplicatorLayer.masksToBounds = true
            verticalReplicatorLayer.instanceRedOffset = colorOffset / 3
            let verticalInstanceCount = view.frame.width / (size.width * 2)
            verticalReplicatorLayer.instanceCount = Int(ceil(verticalInstanceCount))
            verticalReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                0, size.height, 0
            )
            let delay = TimeInterval(0.1)
            replicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.addSublayer(replicatorLayer)
            verticalReplicatorLayer.frame = CGRect(x:0,y:0,width: view.layer.frame.width / 2,height: view.layer.frame.width / 2)
            let parentView = UIView(frame: CGRect(x: view.layer.frame.midX / 2, y: view.layer.frame.midY / 1.2, width: view.layer.frame.width / 2, height: view.layer.frame.width / 2))
            parentView.backgroundColor = UIColor.yellow
            //verticalReplicatorLayer.position = CGPoint(x:200,y:300)
            //let rotation = CATransform3DMakeRotation(CGFloat.pi * 30.0 / 180.0, 20, 20, 0)
            //verticalReplicatorLayer.transform = CATransform3DTranslate(rotation, 20, 30, 0)
            parentView.layer.addSublayer(verticalReplicatorLayer)
            parentView.rotate(duration: 4)
            view.addSubview(parentView)
        }
    }
    
    func renderCounterRows(){
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame.size = view.frame.size
        replicatorLayer.frame.size.height /= 2
        replicatorLayer.frame.size.width /= 2
        replicatorLayer.masksToBounds = true
        let imageLayer = CALayer()
        let image = UIImage(named: "jerry")
        imageLayer.contents = image?.cgImage
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 2
        animation.fromValue = 1
        animation.toValue = 0.1
        animation.autoreverses = true
        animation.repeatCount = .infinity
        imageLayer.add(animation, forKey: "hypnoscale")
        if let size = image?.size{
            imageLayer.frame.size = size
            let width = size.width
            let instanceCount = view.frame.width / width
            // Shift each instance by the width of the image
            replicatorLayer.instanceCount = Int(ceil(instanceCount))
            let colorOffset = -1 / Float(replicatorLayer.instanceCount)
            replicatorLayer.instanceBlueOffset = colorOffset
            replicatorLayer.instanceGreenOffset = colorOffset
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                width, 0, 0
            )
            // Reduce the blue & green color component of each instance,
            // effectively making each copy more and more red
            replicatorLayer.addSublayer(imageLayer)
            
            let verticalReplicatorLayer = CAReplicatorLayer()
            verticalReplicatorLayer.frame.size = view.frame.size
            verticalReplicatorLayer.masksToBounds = true
            verticalReplicatorLayer.instanceGreenOffset = colorOffset / 3
            let verticalInstanceCount = view.frame.width / (size.width * 2)
            verticalReplicatorLayer.instanceCount = Int(ceil(verticalInstanceCount))
            verticalReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                0, size.height, 0
            )
            let delay = TimeInterval(0.1)
            replicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.addSublayer(replicatorLayer)
            verticalReplicatorLayer.frame = CGRect(x:0,y:0,width: view.layer.frame.width / 2,height: view.layer.frame.width / 2)
            let parentView = UIView(frame: CGRect(x: view.layer.frame.midX / 4, y: view.layer.frame.midY / 8, width: view.layer.frame.width / 2, height: view.layer.frame.width / 2))

            parentView.layer.addSublayer(verticalReplicatorLayer)
            parentView.layer.cornerRadius = parentView.frame.size.width/2
            parentView.layer.backgroundColor = UIColor.green.cgColor
            parentView.clipsToBounds = true

            //verticalReplicatorLayer.position = CGPoint(x:200,y:300)
            //let rotation = CATransform3DMakeRotation(CGFloat.pi * 30.0 / 180.0, 20, 20, 0)
            //verticalReplicatorLayer.transform = CATransform3DTranslate(rotation, 20, 30, 0)
            parentView.layer.addSublayer(verticalReplicatorLayer)
            parentView.counterRotate(duration: 8)
            view.addSubview(parentView)
        }
    }
    
    func renderZAxisRows(){
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame.size = view.frame.size
        replicatorLayer.frame.size.height /= 2
        replicatorLayer.frame.size.width /= 2
        replicatorLayer.masksToBounds = true
        let imageLayer = CALayer()
        let image = UIImage(named: "bf")
        imageLayer.contents = image?.cgImage
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 2
        animation.fromValue = 1
        animation.toValue = 0.1
        animation.autoreverses = true
        animation.repeatCount = .infinity
        imageLayer.add(animation, forKey: "hypnoscale")
        if let size = image?.size{
            imageLayer.frame.size = size
            let width = size.width
            let instanceCount = view.frame.width / width
            // Shift each instance by the width of the image
            replicatorLayer.instanceCount = Int(ceil(instanceCount))
            let colorOffset = -1 / Float(replicatorLayer.instanceCount)
            replicatorLayer.instanceBlueOffset = colorOffset
            replicatorLayer.instanceRedOffset = colorOffset
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                width, 0, 0
            )
            // Reduce the blue & red color component of each instance,
            // effectively making each copy more and more green
            replicatorLayer.addSublayer(imageLayer)
            
            let verticalReplicatorLayer = CAReplicatorLayer()
            verticalReplicatorLayer.frame.size = view.frame.size
            verticalReplicatorLayer.masksToBounds = true
            verticalReplicatorLayer.instanceGreenOffset = colorOffset / 3
            let verticalInstanceCount = view.frame.width / (size.width * 2)
            verticalReplicatorLayer.instanceCount = Int(ceil(verticalInstanceCount))
            verticalReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(
                0, size.height, 0
            )
            let delay = TimeInterval(0.1)
            replicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.instanceDelay = delay
            verticalReplicatorLayer.addSublayer(replicatorLayer)
            verticalReplicatorLayer.frame = CGRect(x:0,y:0,width: view.layer.frame.width / 2,height: view.layer.frame.width / 2)
            let parentView = UIView(frame: CGRect(x: view.layer.frame.midX / 4, y: view.layer.frame.midY * 1.5, width: view.layer.frame.width / 2, height: view.layer.frame.width / 2))
        
            parentView.layer.addSublayer(verticalReplicatorLayer)
            parentView.layer.cornerRadius = parentView.frame.size.width/2
            parentView.layer.borderWidth = 2
            parentView.layer.borderColor = UIColor.blue.cgColor
            parentView.clipsToBounds = true
            parentView.ZRotate(duration: 8)
            view.addSubview(parentView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

