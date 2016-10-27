//
//  ViewController.swift
//  BullsEye
//
//  Created by ToAnh T. Tran on 10/26/16.
//  Copyright © 2016 ToAnh T. Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
	var targetValue: Int = 0
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		startNewRound()
		updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
		let difference = abs(targetValue - currentValue)
		let points = 100 - difference
	
		let message = "You scored \(points) points"
		
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
		
        let action = UIAlertAction(
            title:"OK",
            style: .default,
            handler: nil)
		
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
		startNewRound()
		updateLabels()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
	
	func startNewRound() {
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
	}
	
	func updateLabels() {
	targetLabel.text = "\(targetValue)"
	}
}

