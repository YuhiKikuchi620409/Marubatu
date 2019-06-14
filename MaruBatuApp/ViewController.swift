//
//  ViewController.swift
//  MaruBatuApp
//
//  Created by 菊地雄飛 on 2019/06/08.
//  Copyright © 2019 菊地雄飛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showQuestion()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "qAndA") != nil {
            questions = UserDefaults.standard.object(forKey: "qAndA") as! [[String : Any]]
            showQuestion()
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum:Int = 0
    //    String:Any にすることで数字もOK
    //    arrey & dictionary
    var questions:[[String:Any]] = [[:]]
    
    
    
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
            questionLabel.text = que
        }
        
    }
    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans{
                //            正解(true)
                showAlert(message: "Excellent!")
                currentQuestionNum += 1
            }else{
                //                不正解(false)
                showAlert(message: "try again!")
            }
        }else{
            
            return
        }
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        showQuestion()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func tappNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    
    @IBAction func tappYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    
    
}

