//
//  KPGrowSegue.swift
//  KPGrowSegue
//
//  Created by Kunal Pandey on 10/01/16.
//  Copyright © 2016 Øyvind Hauge. All rights reserved.
//

import UIKit

class KPGrowSegue: UIStoryboardSegue, CAAnimationDelegate {
    
    private static var isAnimating = false
    
    var segueFrame : CGRect
    private var shouldUnwind: Bool
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        
        // By default, transition starts from the center of the screen,
        // so let's find the center when segue is first initialized
        
        // Initialize properties
        shouldUnwind = false
        segueFrame = UIScreen.main.bounds
        
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override func perform() {
        
        if KPGrowSegue.isAnimating {
            return
        }
        
        let sourceView = source.view as UIView!
        let destView = destination.view as UIView!
        
        let window = UIApplication.shared.keyWindow
        if !shouldUnwind {
            if let dest = source.navigationController {
                sourceView?.addSubview(destView!)
                destView?.frame = segueFrame
                UIView.animate(withDuration: 0.3, animations: {
                    destView?.frame = UIScreen.main.bounds
                }, completion: { (done) in
                    destView?.removeFromSuperview()
                    dest.viewControllers.append(self.destination)
                })
            }
            
        } else {
            window?.insertSubview(destView!, at:0)
        }
        
    }
}
