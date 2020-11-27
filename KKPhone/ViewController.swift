//
//  ViewController.swift
//  KKPhone
//
//  Created by KKday on 2020/11/25.
//

import UIKit
import DolphinHTTP

class ViewController: UIViewController {

    @IBOutlet weak var goPhoneVC: UIButton!
    
    let m = PhoneManager.shared
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        m.delegate = self
        
        let t = TwilioStudioAPI(loader: URLSessionLoader())
        
        t.createExcution()
    }

    @IBAction func goPhoneVC(_ sender: UIButton) {
        
        m.state = .open
        
        m.getPhoneStatus()
//
//        let vc = PhoneViewController()
//        vc.modalPresentationStyle = .formSheet
//        present(vc, animated: true, completion: nil)
    }
    
}



extension ViewController: PhoneDelegate {
    
    func getPhoneStatus(_ phoneManager: PhoneManager, phoneStaus status: PhoneStatus?) {
        
        print(status)
    }
    
    
}
