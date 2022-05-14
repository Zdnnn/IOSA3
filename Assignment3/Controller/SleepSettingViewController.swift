//
//  RunSettingViewController.swift
//  Assignment3
//
//  Created by Kobe on 2022/4/24.
//

import UIKit

class SleepSettingViewController: UIViewController {
    
    @IBOutlet weak var SleeperName: UITextField!
    @IBOutlet weak var SleepStartBottom: UIButton!
    @IBOutlet weak var SleepTime: UILabel!
    var time: Double = 0
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameSetting(_ sender: UITextField) {
        name = sender.text ?? "Strange sleeper"
    }
    
    @IBAction func minusBottom(_ sender: Any) {
        if (self.time == 0) {
            return
        }
        self.time = self.time - 1
        self.SleepTime.text = String(self.time)
    }
    
    @IBAction func plusBottom(_ sender: Any) {
        self.time = self.time + 1
        self.SleepTime.text = String(self.time)
    }
    
    @IBAction func sleepTimeStart(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.sleepStartTime = Date()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goReady"{
            let viewController = segue.destination as! ReadyViewController
            viewController.sleeperName = name
            viewController.sleepTime = time
        }
    }
    
}
