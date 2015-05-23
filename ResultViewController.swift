//
//  ResultViewController.swift
//  RSB
//
//  Created by Yu Sun on 5/22/15.
//  Copyright (c) 2015 Yu Sun. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    var choiced : String? // what the user chose
    // generate a random number 1 rock, 2 paper, 3 scissors
    var AIChoice : String?
    @IBOutlet var resultText: UILabel!
    @IBOutlet var resultImage:UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        println("in viewWillAppear")
        println(choiced!)
        
        func randomVal(){
            var choices: [String] = ["Paper", "Rock", "Scissors"]
            let randomVal = 1 + arc4random() % 3
            println(choices[randomVal-1])
            AIChoice = choices[randomVal-1]
        }
        
        randomVal()
        
        if let humanChoice = self.choiced {
            if humanChoice == AIChoice {
                println("It is a draw!")
                self.resultImage.image = UIImage(named: "ResultTie")
                resultText.text = "Tie it is"
            } else if humanChoice == "Paper" && AIChoice == "Rock" {
                self.resultImage.image = UIImage(named: "ResultTie")
                resultText.text = "Paper just owned rock you win!"
                
            } else if humanChoice == "Paper" && AIChoice == "Scissors" {
                self.resultImage.image = UIImage(named: "ResultScissorsPaper")
                resultText.text = "Paper didn't do well against Sicssors you lost"
            } else if humanChoice == "Rock" && AIChoice == "Paper"{
                self.resultImage.image = UIImage(named: "ResultPaperRock")
                resultText.text = "Rock just lost to paper, how did that happen?"
            } else if humanChoice == "Rock" && AIChoice == "Scissors"{
                self.resultImage.image = UIImage(named: "ResultScissorsRock")
                resultText.text = "Rock bends scissors oh yeah you win!"
            }
        } else{
            self.resultImage.image = nil
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) {
            self.resultImage.alpha = 1
        }
    }
    
    //dismiss button
    @IBAction func cancelButton() {
        println("cancelButton")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}