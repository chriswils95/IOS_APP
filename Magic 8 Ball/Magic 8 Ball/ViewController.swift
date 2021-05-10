//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Christopher Wilson on 12/20/18.
//  Copyright © 2018 Christopher Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    var randomBallNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        newBallImage()
       
    }
    
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    
    func newBallImage() {
        randomBallNumber = Int.random(in: 0 ... 4)
         ImageView.image = UIImage (named: ballArray[randomBallNumber])
    }
    

}

