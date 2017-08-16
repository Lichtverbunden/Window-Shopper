//
//  MainVC.swift
//  Window-Shopper
//
//  Created by Ken Krippeler on 15.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class MainVC: UIViewController
{
    @IBOutlet weak var wageTextField: CurrencyField!
    @IBOutlet weak var priceTextField: CurrencyField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcButton.backgroundColor = #colorLiteral(red: 0.9699023437, green: 0.5619807713, blue: 0, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcButton.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTextField.inputAccessoryView = calcButton
        priceTextField.inputAccessoryView = calcButton
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }

    @objc func calculate()
    {
        if let wageText = wageTextField.text, let priceText = priceTextField.text
        {
            if let wage = Double(wageText), let price = Double(priceText)
            {
                view.endEditing(true)
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }
    
    @IBAction func clearCalculatorPressed(_ sender: UIButton)
    {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTextField.text = ""
        priceTextField.text = ""
    }
}

