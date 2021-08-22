//
//  MyInfoViewController.swift
//  Caffeine
//
//  Created by hyogang on 2021/08/18.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var switchPregnancy: UISwitch!

    // 전역변수 선언
    let myUserDefaults = UserDefaults.standard
   // var user
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
     let defaults = UserDefaults.standard
     userInput = defaults.string(forKey: "userInput")!

     */
    
    // 0,1 (int)
    
   override func viewWillAppear(_ animated: Bool) {
    
   // let userName = ""
    

    if let userName:String = myUserDefaults.string(forKey: "userName") {
           let userAge:Int = myUserDefaults.integer(forKey: "userAge")
           let userWeight:Int = myUserDefaults.integer(forKey: "userWeight")
           let userPregnancy:Bool = myUserDefaults.bool(forKey: "userPregnancy")

            tfName.text = userName
            tfAge.text = String(userAge)
            tfWeight.text = String(userWeight)
            switchPregnancy.isOn = userPregnancy
      }else{

        self.navigationItem.setHidesBackButton(true, animated: false)

      }

   }
    
    // 넘버패드로 바꾸기
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        guard let userName:String = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        
        guard let userAge:Int = Int(tfAge.text!)! as Int? else {
            return
        }
        
        guard let userWeight : Int = Int(tfWeight.text!)! as Int? else {
            return
        }
        
        guard let userPregnancy : Bool = switchPregnancy.isOn as Bool? else {
            return
        }

        myUserDefaults.set(userName, forKey: "userName")
        myUserDefaults.set(userAge, forKey: "userAge")
        myUserDefaults.set(userWeight, forKey: "userWeight")
        myUserDefaults.set(userPregnancy, forKey: "userPregnancy")

        self.navigationController?.popViewController(animated: true) // 현재 화면 사라짐
        
    } // ---------- btnRegister
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // ---------- MyInfoViewController
