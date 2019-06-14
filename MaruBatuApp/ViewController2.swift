//
//  ViewController2.swift
//  MaruBatuApp
//
//  Created by 菊地雄飛 on 2019/06/13.
//  Copyright © 2019 菊地雄飛. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        初期値に不正解を入れてるよ
        self.answer = false
        
    }
    var data: [
        [String: Any]] = []
    
    
    @IBAction func TopButton(_ sender: Any) {
    }
    
    @IBOutlet weak var text: UITextField!
    
     var answer: Bool!
    
  
        @IBAction func OXButton(_ sender: UISegmentedControl) {
        switch  sender.selectedSegmentIndex{
        case 0:
            answer = false
            
        case 1:
            answer = true
        default:
            print("エラー")
        }
    


    }
    
    @IBAction func hozonButton(_ sender: Any) {
        if text.text == ""{
            showAlert2(message: "問題を追加してください")
        }else {
            var ques = text.text!
            //            配列を入れる
            data.append(["question": ques, "answer": answer])
            text.text = ""
            //ユーザーデフォルトにデータを保存
            UserDefaults.standard.set( data, forKey: "qAndA")
            //
            
        }
    }
    
    
    @IBAction func DelButton(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "qAndA")
        showAlert2(message: "All Delete")
    }
    //    アラートをつける関数
    func showAlert2(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
