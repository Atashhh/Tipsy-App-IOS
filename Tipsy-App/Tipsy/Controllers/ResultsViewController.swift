//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Atash Musazade on 26.01.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var calculatedResult: String?
    var numberOfPeople: Int?
    var tipPercentage: Int?

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
