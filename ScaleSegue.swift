//
//  ScaleSegue.swift
//  MrCanvas
//
//  Created by Mayank Singh on 15/03/19.
//  Copyright © 2019 Kumar. All rights reserved.
//

import UIKit


//Scaling segue 
class ScaleSegue: UIStoryboardSegue {
    
    override func perform()  {
        scale()
        
    }
    
    func scale()  {
        
        let toVC = self.destination
        let fromVC = self.source
        
        let containerView = fromVC.view.superview
        let originalCenter = fromVC.view.center
        toVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVC.view.center = originalCenter
        containerView?.addSubview(toVC.view)
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: {
            toVC.view.transform = CGAffineTransform.identity
        }) { (success) in
            
            fromVC.present(toVC, animated: false, completion: nil)
            print("hi this is ")
            
        }
        
    }

}

// Fade in segue 
class FadeInSegue: UIStoryboardSegue {
    
    override func perform()  {
        fadeIn()
        
    }
    
    func fadeIn()  {
        
        // Get the view of the source
        let sourceViewControllerView = self.source.view
        // Get the view of the destination
        let destinationViewControllerView = self.destination.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // Make the destination view the size of the screen
        destinationViewControllerView!.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        // Insert destination below the source
        // Without this line the animation works but the transition is not smooth as it jumps from white to the new view controller
        destinationViewControllerView?.alpha = 0
        sourceViewControllerView!.addSubview(destinationViewControllerView!);
        // Animate the fade, remove the destination view on completion and present the full view controller
        UIView.animate(withDuration: 1, animations: {
            destinationViewControllerView!.alpha = 1;
        }, completion: { (finished) in
            destinationViewControllerView!.removeFromSuperview()
            self.source.present(self.destination, animated: false, completion: nil)
        })
    }
        
    }
    

