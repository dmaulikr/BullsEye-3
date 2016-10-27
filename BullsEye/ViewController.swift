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

    override func viewDidLoad() {
        super.viewDidLoad()
		startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
		let message = "The value of the slider is: \(currentValue)" +
						"\nThe target value is: \(targetValue)"
		
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
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
	
	func startNewRound() {
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
	}
}

