//
//  ViewController.swift
//  Bullseye
//
//  Created by Lilly Liu on 10/2/20.
//

import UIKit
import Foundation
var randomNumber = 0

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    
    var randomNumber = 0

    override func viewDidLoad() {
            super.viewDidLoad()
            randomNumber = Int(arc4random_uniform(101))
                    numLabel.text = "Move the slider to: \(randomNumber)"
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        print(numSlider.value)
    }
    @IBOutlet weak var exactSwitch: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
                randomNumber = Int(arc4random_uniform(101))
                numLabel.text = "Move the slider to: \(randomNumber)"
                resultLabel.isHidden = true //must reappear next time it is checked ^
                playAgainButton.isHidden = true
    }
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
                    if randomNumber-3 <= Int(numSlider.value) && randomNumber+3 >= Int(numSlider.value){
                        resultLabel.text = "You were right on point! Bullseye!"
                    } else {
                        resultLabel.text = "Whoops! You missed! Try again later"
                    }
        } else {
            if (Int (numSlider.value)) == randomNumber {
            resultLabel.text = "You were on point! \nBullseye :)"
            } else {
                resultLabel.text = "Oof ya missed. Rip!"
            }
        }
        resultLabel.isHidden = false //we'll come back to this
        playAgainButton.isHidden = false
    }
    
}

