//
//  ViewController.swift
//  GameColorPicker
//
//  Created by Roberto Evangelista on 01/12/18.
//  Copyright © 2018 Roberto Evangelista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rgb = [Float]()
    var difficulty: Float = 30

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    @IBAction func changeColor(_ sender: Any) {
        let red = rSlider.value
        let green = gSlider.value
        let blue = bSlider.value
        firstImageView.backgroundColor = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(1))
    }
    
    @IBAction func chooseDifficulty(_ sender: Any) {
        switch difficultyControl.selectedSegmentIndex {
        case 0:
            difficulty = 20
        case 1:
            difficulty = 15
        case 2:
            difficulty = 10
        default:
            break;
        }
    }
    
    @IBAction func checkButton(_ sender: Any) {
        var checks = [rSlider.value - rgb[0], gSlider.value - rgb[1], bSlider.value - rgb[2]]
        for index in 0...2 {
            if checks[index] < 0 {
                checks[index] = checks[index] * -1
            }
        }
        
        for check in checks {
            if check > difficulty {
                statusLabel.text = "Você Perdeu"
            } else {
                statusLabel.text = "Você Ganhou"
            }
        }
    }
    
    func generateNewColor(){
        for _ in 0...2 {
            rgb.append(Float.random(in: 0...255))
        }
    }
    
    func startNewGame() {
        generateNewColor()
        secondImageView.backgroundColor = UIColor(red: CGFloat(rgb[0]/255), green: CGFloat(rgb[1]/255), blue: CGFloat(rgb[2]/255), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
}

