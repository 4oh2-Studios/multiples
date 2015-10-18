//
//  ViewController.swift
//  multiples
//
//  Created by Anthony Murphy on 10/18/15.
//  Copyright © 2015 4oh2 Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var multipleInput: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var txtLabel: UILabel!
    
    //Variables
    var multiple = 0
    var oldSum = 0
    var max = 50
    
    //Functions
    
    func restart() {
        multiple = 0
        oldSum = 0

        
        logo.hidden = false
        multipleInput.hidden = false
        playBtn.hidden = false
        addBtn.hidden = true
        txtLabel.hidden = true
        multipleInput.text = ""
        }
    
    func isOver() -> Bool {
        if oldSum  >= 50 {
            return true
        } else {
            return false
        }
    }
    
    func updateTxt(oldSum: Int, mul: Int, newSum: Int) {
        txtLabel.text = "\(oldSum) + \(multiple) = \(newSum)"
    }
    
    func resetTxtLabel() {
        txtLabel.text = "Press Add to Add"
    }
    
    //Actions
    @IBAction func onMultPress(sender: UIButton!)  {
        if multipleInput.text != nil && multipleInput.text != "" {
    
        logo.hidden = true
        multipleInput.hidden = true
        playBtn.hidden = true
    
        addBtn.hidden = false
        txtLabel.hidden = false
    
        multiple = Int(multipleInput.text!)!
        oldSum = 0
        resetTxtLabel()

        }
    }
    
    @IBAction func onAdd(sender: UIButton!) {
        let newSum = oldSum + multiple
        updateTxt(oldSum, mul: multiple, newSum: newSum)
        oldSum += multiple
        
        if isOver() {
            restart()
        }
    }
    
}