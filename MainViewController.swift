//
//  MainViewController.swift
//  Arithmetic
//
//  Created by Xristopher Somera on 8/4/18.
//  Copyright © 2018 sirX Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var winScreen: UIImageView?
    @IBOutlet weak var resetBack: UIImageView?
    @IBOutlet weak var targetLabel:UILabel?
    @IBOutlet weak var currentValLabel:UILabel?
    @IBOutlet weak var resetButton: UIButton?
    @IBOutlet weak var addOp:UIButton?
    @IBOutlet weak var subOp:UIButton?
    @IBOutlet weak var mulOp:UIButton?
    @IBOutlet weak var divOp:UIButton?
    var target:Int = 0
    var currentVal:Int = 0
    var addVal:Int = 0
    var subVal:Int = 0
    var mulVal:Int = 0
    var divVal:Int = 0
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initVals()
        resetBack?.isHidden = true
        resetButton?.isHidden = true
        winScreen?.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initVals() {
        target = generateBigRandomNumber()
        targetLabel?.text = "\(target)"
        
        currentVal = generateBigRandomNumber()
        currentValLabel?.text = "\(currentVal)"
        
        addVal = generateSmallRandomNumber()
        addOp?.setTitle("+ " + "\(addVal)", for: .normal)

        subVal = generateSmallRandomNumber()
        subOp?.setTitle("- " + "\(subVal)", for: .normal)
        
        mulVal = generateSmallRandomNumber()
        mulOp?.setTitle("x " + "\(mulVal)", for: .normal)
        
        divVal = generateSmallRandomNumber()
        divOp?.setTitle("÷ " + "\(divVal)", for: .normal)
        
    }
    
    @IBAction func AddOpClick(_ sender: UIButton) {
        currentVal += addVal
        currentValLabel?.text = "\(currentVal)"
        
        if currentVal == target {
            win()
        }
        
        addVal = generateSmallRandomNumber()
        addOp?.setTitle("+ " + "\(addVal)", for: .normal)
        
    }
    
    @IBAction func SubOpClick(_ sender: UIButton) {
        currentVal -= subVal
        currentValLabel?.text = "\(currentVal)"
        
        if currentVal == target {
            win()
        }
        
        subVal = generateSmallRandomNumber()
        subOp?.setTitle("- " + "\(subVal)", for: .normal)
    }
    
    @IBAction func MulOpClick(_ sender: UIButton) {
        currentVal *= mulVal
        currentValLabel?.text = "\(currentVal)"
        
        if currentVal == target {
            win()
        }
        
        mulVal = generateSmallRandomNumber()
        mulOp?.setTitle("x " + "\(mulVal)", for: .normal)
    }
    
    @IBAction func DivOpClick(_ sender: UIButton) {
        currentVal /= divVal
        currentValLabel?.text = "\(currentVal)"
        
        if currentVal == target {
            win()
        }
        
        divVal = generateSmallRandomNumber()
        divOp?.setTitle("÷ " + "\(divVal)", for: .normal)
    }
    
    @IBAction func resetClick(_ sender: UIButton) {
        resetBack?.isHidden = true
        resetButton?.isHidden = true
        winScreen?.isHidden = true

        
        initVals()
    }
    
    func win() {
        resetBack?.isHidden = false
        resetButton?.isHidden = false
        winScreen?.isHidden = false

    }
    
    func generateBigRandomNumber() -> Int {
      let digit:Int = Int(arc4random_uniform(101) + 1)
      return digit
    }
    
    func generateSmallRandomNumber() -> Int {
        let digit:Int = Int(arc4random_uniform(10) + 1)
        return digit
    }

}
