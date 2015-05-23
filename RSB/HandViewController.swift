//
//  HandViewController.swift
//  RSB
//
//  Created by Yu Sun on 5/22/15.
//  Copyright (c) 2015 Yu Sun. All rights reserved.
//

import UIKit

class HandViewController: UIViewController {
    var choice: String? // optional

    @IBAction func choosePaper(){
        println("paper")
        choice = "Paper"
        makeChoiceHybridCodeSegue()
    }
    @IBAction func chooseRock(){
        //code only transition from VC to VC
        println("rock") //debug
        choice = "Rock" //set the choice
        makeChoice() //call makeChoice which is the manual code part - presentViewController-
        
    }
    
    func chooseScissors(){
        println("scissors")
        choice = "Scissors"
    }
//    func randomVal(){
//        var choices: [String] = ["Paper", "Rock", "Scissors"]
//        let randomVal = 1 + arc4random() % 3
//        println(choices[randomVal-1])
//    }
    
    @IBAction func makeChoice(){
        var controller: ResultViewController // make variable type  = destination VC type
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as ResultViewController
        
        //instantiate the variable, asking is the destination VC exists on storyboard, requires a storyboard ID to connect
        
//        if let test = self.choice {
//            println("In makeChoice " + test) //debug
//        }
//        
        controller.choiced = self.choice //pass data from current VC to the next
        
        presentViewController(controller, animated: true, completion: nil) //presentViewController key way to travel from VC1 to VC2
    }
    //get segue by identifier swift
    //pass data from 1st VC to 2nd VC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "makeChoiceHybridCodeSegue") {
            if let destVC = segue.destinationViewController as? ResultViewController {
                destVC.choiced = choice
            }
        }
        
        if (segue.identifier == "makeChoiceStoryboard"){
            chooseScissors() //set choice = paper
            if let destVC = segue.destinationViewController as? ResultViewController {
                destVC.choiced = choice
            }
        }
    }
    
    @IBAction func makeChoiceHybridCodeSegue(){
        // choosePaper hybrid code + storyboard segue
        performSegueWithIdentifier("makeChoiceHybridCodeSegue", sender: self)
    }

    
}

