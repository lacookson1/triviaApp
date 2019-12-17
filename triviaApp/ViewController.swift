//
//  ViewController.swift
//  triviaApp
//
//  Created by Liam Cookson on 17/12/2019.
//  Copyright © 2019 Liam Cookson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["1 x 1 =", "2 x 2 =", "3 x 3 ="]
    
    let answers = [["1", "2", "0"], ["2", "4", "6"], ["3", "6", "9"]]

    var currentQuestion = 0
    
    var rightAnswerPlacement:UInt32 = 0
    
    var points = 0
    
    //label
    @IBOutlet weak var qlbl: UILabel!
    
    //buttons
    @IBAction func action(_ sender: Any) {
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement)){
            print("Correct")
            points += 10
        }
        else {
            print("incorrect")
        }
        if (currentQuestion != questions.count) {
            newQuestion()
        }
        else if currentQuestion == questions.count {
            endQuiz()
    }
}
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    func newQuestion() {
        qlbl.text = questions[currentQuestion
        ]
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...3 {
            button = view.viewWithTag(i) as!UIButton
            if
                (i == Int(rightAnswerPlacement)){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    func endQuiz () {
        if points == 30 {
        performSegue(withIdentifier: "pass", sender: self)
    }
    else {
    performSegue(withIdentifier: "fail", sender: self)
    }
        
        func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
}
