//
//  ViewController.swift
//  Counter
//
//  Created by user on 12.09.2024.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var history: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        let score = Int(number.text!)!
        number.text = String(score + 1)
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        history.text += "\n\(currentDate): значение изменено на +1"
    }
    
    @IBAction func subtraction(_ sender: Any) {
        let score = Int(number.text!)!
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        if score > 0 {
            number.text = String(score - 1)
            history.text += "\n\(currentDate): значение изменено на -1"
        } else {
            
            history.text += "\n\(currentDate): попытка уменьшить значение счетчика ниже 0"
        }
    }
    

    @IBAction func changeToZero(_ sender: Any) {
        number.text = "0"
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        history.text += "\n\(currentDate): значение сброшено"
    }
}
