//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Grace Carroll on 2/22/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            //if not nil, create constant containing value to right of =
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("😡ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
        }else{
            print("😡ERROR: Could not read data from file sound0")
        }
    }

    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalImageFrame = imageView.frame
        let wShrink: CGFloat = 20
        let hShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + wShrink,
            y: imageView.frame.origin.y + hShrink,
            width: imageView.frame.width - (2 * wShrink),
            height: imageView.frame.height - (2 * hShrink))
        imageView.frame = smallerImageFrame
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalImageFrame})
        
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let wShrink: CGFloat = 20
        let hShrink: CGFloat = 20
        let smallerImageFrame = CGRect(
            x: imageView.frame.origin.x + wShrink,
            y: imageView.frame.origin.y + hShrink,
            width: imageView.frame.width - (2 * wShrink),
            height: imageView.frame.height - (2 * hShrink))
        imageView.frame = smallerImageFrame
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {self.imageView.frame = originalImageFrame}) 
    }
    
}

