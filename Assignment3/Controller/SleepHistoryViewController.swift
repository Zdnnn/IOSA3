//
//  RunHistoryViewController.swift
//  Assignment3
//
//  Created by Kobe on 2022/4/25.
//

import UIKit

class SleepHistoryViewController: UIViewController {
    var historyDictionary1:Dictionary = [String:Double]()
    var retrieveUserDefault1:Dictionary? = [String:Double]()
    var array1 = [(key:String, value:Double)]()
    var historyDictionary2:Dictionary = [String:String]()
    var retrieveUserDefault2:Dictionary? = [String:String]()
    var array2 = [(key:String, value:String)]()

    @IBOutlet weak var sleeper1: UILabel!
    @IBOutlet weak var sleeper2: UILabel!
    @IBOutlet weak var sleeper3: UILabel!
    @IBOutlet weak var hour1: UILabel!
    @IBOutlet weak var hour2: UILabel!
    @IBOutlet weak var hour3: UILabel!
    @IBOutlet weak var duration1: UILabel!
    @IBOutlet weak var duration2: UILabel!
    @IBOutlet weak var duration3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUserDefault1 = UserDefaults.standard.dictionary(forKey: "Sleeper") as? Dictionary<String,Double>
        if retrieveUserDefault1 != nil {
            historyDictionary1 = retrieveUserDefault1!
            array1 = historyDictionary1.sorted(by: {$0.value > $1.value})
        }
        
        retrieveUserDefault2 = UserDefaults.standard.dictionary(forKey: "Duration") as? Dictionary<String,String>
        if retrieveUserDefault2 != nil {
            historyDictionary2 = retrieveUserDefault2!
            array2 = historyDictionary2.sorted(by: {$0.value > $1.value})
        }
        
        if array1.count == 1{
            sleeper1.text = array1[0].key
            hour1.text = "\(array1[0].value)"
        }else if array1.count == 2 {
            sleeper1.text = array1[0].key
            hour1.text = "\(array1[0].value)"
            sleeper2.text = array1[1].key
            hour2.text = "\(array1[1].value)"
        }else if array1.count == 3 {
            sleeper1.text = array1[0].key
            hour1.text = "\(array1[0].value)"
            sleeper2.text = array1[1].key
            hour2.text = "\(array1[1].value)"
            sleeper3.text = array1[2].key
            hour3.text = "\(array1[2].value)"
        }
        
        if array1.count == 1{
            duration1.text = "\(array2[0].value)"
        }else if array1.count == 2 {
            duration1.text = "\(array2[0].value)"
            duration2.text = "\(array2[1].value)"
        }else if array1.count == 3 {
            duration1.text = "\(array2[0].value)"
            duration2.text = "\(array2[1].value)"
            duration3.text = "\(array2[2].value)"
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "Sleeper")
        UserDefaults.standard.removeObject(forKey: "Duration")
        sleeper1.text = "N/A"
        sleeper2.text = "N/A"
        sleeper3.text = "N/A"
        hour1.text = "N/A"
        hour2.text = "N/A"
        hour3.text = "N/A"
        duration1.text = "N/A"
        duration2.text = "N/A"
        duration3.text = "N/A"
    }
}
