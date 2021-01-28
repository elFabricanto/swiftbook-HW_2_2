//
//  ViewController.swift
//  HW_2_2
//
//  Created by Даниил on 27.01.2021.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IB Outlets
    @IBOutlet var lightChanger: UIButton!
    @IBOutlet weak var light: UIStackView!
    
    // MARK: - Private Properties
    private var clickCounter = 0
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        turnLightOff()
    }
    
    //MARK: - IB Actions
    @IBAction func changeLightColor() {
        lightChanger.setTitle("NEXT", for: .normal)
        turnNextLightOn()
    }
    
    //MARK: - Private Methods
    private func turnLightOff() {
        for lightItem in light.arrangedSubviews {
            lightItem.layer.cornerRadius = lightItem.frame.width / 2
            lightItem.alpha = 0.3
        }
    }
    
    private func turnNextLightOn() {
        let currentLightItem = clickCounter % (light.arrangedSubviews.count * 2 - 2)
        if currentLightItem < light.arrangedSubviews.count {
            turnLightOff()
            light.arrangedSubviews[currentLightItem].alpha = 1
        } else {
            turnLightOff()
            light.arrangedSubviews[currentLightItem - light.arrangedSubviews.count + 1].alpha = 1
        }
        clickCounter += 1
    }
    
}

