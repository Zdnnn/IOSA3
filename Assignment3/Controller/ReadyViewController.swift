//
//  ReadyViewController.swift
//  Assignment3
//
//  Created by Kobe on 2022/4/24.
//

import UIKit

class ReadyViewController: UIViewController {
    var sleeperName:String = ""
    var sleepTime:Double = 0
    @IBOutlet weak var countNumber: UILabel!
    @IBOutlet weak var countWord: UILabel!
    
    var startTime:Int = 3
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countChange), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func countChange(){
        startTime -= 1;
        if startTime == 3 {
            countNumber.text = String(startTime)
            countWord.text = "Drinking a glass of milk can help you sleep!"
        }
        else if startTime == 2 {
            countNumber.text = String(startTime)
            countWord.text = "Enjoy your sleep tonight!"
        }
        else if startTime == 1 {
            countNumber.text = String(startTime)
            countWord.text = "See you tomorrow!"
        }
        else if startTime == 0 {
            countNumber.text = String(startTime)
            performSegue(withIdentifier: "goSleeping", sender: nil)
            timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSleeping" {
            let viewController = segue.destination as! EndSleepingViewController
            viewController.sleeperName = sleeperName
            viewController.sleepTime = sleepTime
        }
    }


}
