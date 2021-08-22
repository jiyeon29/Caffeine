//
//  MyInfoViewController.swift
//  Caffeine
//
//  Created by hyogang on 2021/08/18.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    // UI
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var switchPregnancy: UISwitch!
    @IBOutlet weak var btnCompletion: UIButton!
    
    let myUserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // btnCompletion UI Setting
        btnCompletion.layer.cornerRadius = 8
       // btnCompletion.layer.borderColor = CGColor(red: 0.2196, green: 0.1098, blue: 0, alpha: 1) // c100
       // btnCompletion.layer.borderWidth = 2.0
 
    } // ---------- viewDidLoad
    
    
   override func viewWillAppear(_ animated: Bool) {

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

   } // ---------- viewWillAppear

    
    @IBAction func btnRegister(_ sender: UIButton) {
        
//        var button_isActive: Bool = false
//
//        if button_isActive {
//            UIView.animate(withDuration: 0.2) {
//                sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            }
//        } else {
//            UIView.animate(withDuration: 0.2) {
//                sender.backgroundColor = UIColor(named: "c100")
//            }
//        }
//        button_isActive = !button_isActive
        
        
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
    
    
    func btnRegisterAction() {
        
        
        
        
            
    }
    
    
//    func btnRegisterAction(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // ---------- MyInfoViewController
