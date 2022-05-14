//
//  EndRuningViewController.swift
//  Assignment3
//
//  Created by Kobe on 2022/4/24.
//

import UIKit

class EndSleepingViewController: UIViewController {
    var sleeperName:String = ""
    var sleepTime:Double = 0

    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var timeDisplay: UILabel!
    
    // Initial loading Read name and time
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDisplay.text = sleeperName
        timeDisplay.text = "\(sleepTime)"
        // Do any additional setup after loading the view.
    }

    
    @IBAction func sleepTimeStop(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.sleepEndTime = Date()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSummary" {
            let viewController = segue.destination as! SleepSummaryViewController
            viewController.sleeperName = sleeperName
            viewController.sleepTime = sleepTime
        }
    }
    
    
}
