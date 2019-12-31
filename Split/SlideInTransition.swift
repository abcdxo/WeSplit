//
//  SlideInTransition.swift
//  Split
//
//  Created by Nick Nguyen on 12/23/19.
//  Copyright © 2019 Nick Nguyen. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject , UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
             let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            // Add menu view controller to container
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            
            containerView.addSubview(toViewController.view)
            // Init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
            
        }
        
        //Animate on screen
        
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //Animate back off screen
        
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        // Animation of the transition
        
        let duration = transitionDuration(using: transitionContext)
        let isCancalled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration,animations:  {
            self.isPresenting ? transform() : identity()
        }) {
            (_) in
            transitionContext.completeTransition(!isCancalled)
        }
        
        
    }
    

}
