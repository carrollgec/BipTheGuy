//
//  ViewController.swift
//  UIViewAnimations
//
//  Created by Grace Carroll on 2/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var colorChangeButton: UIButton!
    
    var colorIndex = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear imageView.frame.origin.x = \(imageView.frame.origin.x )")
    }
    
    override func viewDidLayoutSubviews() {
//        let deviceWidth = view.frame.width
//        imageView.frame.origin.x = deviceWidth
//        alphaButton.frame.origin.x = deviceWidth
//        pulseButton.frame.origin.x = deviceWidth
//        colorChangeButton.frame.origin.x = deviceWidth
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear imageView.frame.origin.x = \(imageView.frame.origin.x )")
        let deviceWidth = view.frame.width
        imageView.frame.origin.x = deviceWidth
        alphaButton.frame.origin.x = deviceWidth
        pulseButton.frame.origin.x = deviceWidth
        colorChangeButton.frame.origin.x = deviceWidth
    }
     
    @IBAction func movePressed(_ sender: UIButton) {
        let centerX = view.center.x

        UIView.animate(withDuration: 0.5, animations: {self.imageView.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.alphaButton.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.pulseButton.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.colorChangeButton.center.x = centerX})
        
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {self.imageView.center.x = centerX
//        }, completion: nil)
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseIn, .repeat, .autoreverse], animations: {self.alphaButton.center.x = centerX
//        }, completion: nil)
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut, .repeat, .autoreverse], animations: {self.pulseButton.center.x = centerX
//        }, completion: nil)
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {self.colorChangeButton.center.x = centerX
//        }, completion: nil)
    }
    
    @IBAction func alphaPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {self.imageView.alpha = (self.imageView.alpha == 1 ? 0.0 : 1.0)})
    }
     
    func bipGuy(){
        let originalImageFrame = imageView.frame
        let wShrink: CGFloat = 20
        let hShrink: CGFloat = 20
        let smallerImageFrame = CGRect(x: imageView.frame.origin.x + wShrink,
                                  y: imageView.frame.origin.y + hShrink,
                                  width: imageView.frame.width - (2 * wShrink),
                                  height: imageView.frame.height - (2 * hShrink))
        imageView.frame = smallerImageFrame
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalImageFrame})
        
    }
    
    @IBAction func pulsePressed(_ sender: UIButton) {
        let originalFrame = sender.frame
        let widthShrink:CGFloat = 30
        let heightShrink:CGFloat = 10
        let smallerFrame = CGRect(
            x: sender.frame.origin.x + widthShrink,
            y: sender.frame.origin.y + heightShrink,
            width: sender.frame.width - (2 * widthShrink),
            height: sender.frame.height - (2 * heightShrink))
        sender.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {sender.frame = originalFrame})
        bipGuy()
    }
    @IBAction func colorChangePressed(_ sender: UIButton) {
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemIndigo, .purple]
        UIView.animate(withDuration: 0.5, animations: {self.colorChangeButton.backgroundColor = colors[self.colorIndex]})
        
//        colorIndex += 1
//        if colorIndex == colors.count{
//            colorIndex = 0
 //       }
    colorIndex = (colorIndex + 1 == colors.count ? 0 : colorIndex + 1)
    }
    

}

