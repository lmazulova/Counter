//
//  ViewController.swift
//  Counter
//
//  Created by user on 12.09.2024.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var restartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add(_ sender: UIButton) {
        let score = Int(numberLabel.text!)!
        numberLabel.text = String(score + 1)
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        historyTextView.text += "\n\(currentDate): значение изменено на +1"
    }
    @IBAction func subtraction(_ sender: UIButton) {
        let score = Int(numberLabel.text!)!
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        if score > 0 {
            numberLabel.text = String(score - 1)
            historyTextView.text += "\n\(currentDate): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(currentDate): попытка уменьшить значение счетчика ниже 0"
        }
    }
    @IBAction func restart(_ sender: UIButton) {
        numberLabel.text = "0"
        let currentDate = Date().formatted(date: .numeric, time: .standard)
        historyTextView.text += "\n\(currentDate): значение сброшено"
    }
}
