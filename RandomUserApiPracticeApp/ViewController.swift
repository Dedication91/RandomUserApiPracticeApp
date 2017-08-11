//
//  ViewController.swift
//  RandomUserApiPracticeApp
//
//  Created by Shaan Mirchandani 
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    var firstname  = ""
    var city = ""
    var gender = ""
    var phone = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainURL = "https://randomuser.me/api"
        
        Alamofire.request(mainURL).responseJSON { (response) in
            
        
        let result = response.result
           // print(result)
        
        
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let innerDictR = (dict["results"]! as! NSArray) [0] as? Dictionary<String, AnyObject> {
                    
                    if let webGender = innerDictR["gender"] as? String {
                        self.gender = webGender
                        print(self.gender)
                    }
                    
                    
                }
            }
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                    if let webPhone = myNewDict["phone"] as? String {
                        self.phone = webPhone
                        print(self.phone)
                    }
                }
            }
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let myNewDict = (dict["results"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                    if let name = myNewDict["name"] as? Dictionary<String, AnyObject> {
                        if let webFirst = name["first"] as? String {
                            self.firstname = webFirst
                            print(self.firstname)
                        }
                    }
                }
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

