//
//  HandViewController.swift
//  RSB
//
//  Created by Yu Sun on 5/22/15.
//  Copyright (c) 2015 Yu Sun. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {
    var choice: String?
    
    func choosePaper(){
        println("paper")
        choice = "Paper"
    }
    @IBAction func chooseRock(){
        println("rock")
        choice = "Rock"
        makeChoice()
        
    }
    func chooseScissors(){
        println("scissors")
        choice = "Scissors"
    }
    func randomVal(){
        var choices: [String] = ["Paper", "Rock", "Scissors"]
        let randomVal = 1 + arc4random() % 3
        println(choices[randomVal-1])
    }
    
    @IBAction func makeChoice(){
        var controller: ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as ResultViewController
        
        if let test = self.choice {
            println("In makeChoice " + test)
        }
        
        controller.choiced = self.choice
        
        presentViewController(controller, animated: true, completion: nil)
    }
}

