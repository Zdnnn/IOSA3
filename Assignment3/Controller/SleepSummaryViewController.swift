//
//  RunSummaryViewController.swift
//  Assignment3
//
//  Created by Kobe on 2022/4/24.
//

import UIKit
import CoreData

class SleepSummaryViewController: UIViewController {
    
    var sleeperName:String = ""
    var sleepTime:Double = 0
    var sleepDuration:String = ""
    var historyDictionary1:Dictionary = [String:Double]()
    var retrieveUserDefault1:Dictionary? = [String:Double]()
    var array1 = [(key:String, value:Double)]()
    var historyDictionary2:Dictionary = [String:String]()
    var retrieveUserDefault2:Dictionary? = [String:String]()
    var array2 = [(key:String, value:String)]()

    
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var EndTime: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let sleepStartDateStr: String = dateFormatter.string(from: appDelegate.sleepStartTime)
        let sleepEndDateStr: String = dateFormatter.string(from: appDelegate.sleepEndTime)
        let sleepTimeInterval = appDelegate.sleepEndTime.timeIntervalSince1970 - appDelegate.sleepStartTime.timeIntervalSince1970
        let hours: Int = Int(sleepTimeInterval / 3600)
        let rest: Double = sleepTimeInterval - Double(hours) * 3600.0
        let minutes: Int = Int(rest / 60.0)
        
        startTime.text = sleepStartDateStr
        EndTime.text = sleepEndDateStr
        duration.text = "\(hours) h \(minutes) m"
        sleepDuration = "\(hours) h \(minutes) m"
        
        //load History
        retrieveUserDefault1 = UserDefaults.standard.dictionary(forKey: "Sleeper") as? Dictionary<String,Double>
        if retrieveUserDefault1 != nil {
            historyDictionary1 = retrieveUserDefault1!
            array1 = historyDictionary1.sorted(by:{$0.value > $1.value})
        }
        
        retrieveUserDefault2 = UserDefaults.standard.dictionary(forKey: "Duration") as? Dictionary<String,String>
        if retrieveUserDefault2 != nil {
            historyDictionary2 = retrieveUserDefault2!
            array2 = historyDictionary2.sorted(by:{$0.value > $1.value})
        }
        
        update1()
        update2()
        // Do any additional setup after loading the view.
    }
    
    func update1(){
        if retrieveUserDefault1 != nil{
            if retrieveUserDefault1!.keys.contains("\(sleeperName)"){
                let time:Double = retrieveUserDefault1!["\(sleeperName)"]!
                historyDictionary1.updateValue(time, forKey: "\(sleeperName)")
                UserDefaults.standard.set(historyDictionary1, forKey: "Sleeper")
            } else {
                historyDictionary1.updateValue(sleepTime, forKey: "\(sleeperName)")
                UserDefaults.standard.set(historyDictionary1, forKey: "Sleeper")
            }
        }else{
            historyDictionary1.updateValue(sleepTime, forKey: "\(sleeperName)")
            UserDefaults.standard.set(historyDictionary1, forKey: "Sleeper")
            }
        }
    
    
    func update2(){
        if retrieveUserDefault2 != nil{
            if retrieveUserDefault2!.keys.contains("\(sleeperName)"){
                let duration:String = retrieveUserDefault2!["\(sleeperName)"]!
                historyDictionary2.updateValue(duration, forKey: "\(sleeperName)")
                UserDefaults.standard.set(historyDictionary2, forKey: "Duration")
            } else {
                historyDictionary2.updateValue(sleepDuration, forKey: "\(sleeperName)")
                UserDefaults.standard.set(historyDictionary2, forKey: "Duration")
            }
        }else{
            historyDictionary2.updateValue(sleepDuration, forKey: "\(sleeperName)")
            UserDefaults.standard.set(historyDictionary2, forKey: "Duration")
        }
    }
}
