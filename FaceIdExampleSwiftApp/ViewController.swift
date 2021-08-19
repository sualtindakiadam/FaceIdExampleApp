//
//  ViewController.swift
//  FaceIdExampleSwiftApp
//
//  Created by Semih Kalaycı on 19.08.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var signInLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){ // deviceOwnerAuthenticationWithBiometrics kontrolü biometrik yani parmak izi veya yüz tanıma için seçilir
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in// info pliste face id ekle
                
                //face id test etmek için simulatörde üst menüde Features - Face ID - Enrolled seç ve yine aynı menüde test etmek için face id eşleşti eşleşmedi seçenekleriyle de kontrol et
                if success == true {
                    
                    //successfull
                    DispatchQueue.main.async { // arka planda kullanıcı arayüzünü etkileyecek bir iş yapıyorsak işlemi farklı bir thread da yapmak gerekir.
                              self.performSegue(withIdentifier: "signedVC", sender: nil)
                    }
              
                }else{
                    DispatchQueue.main.async {
                        self.signInLabel.text = "Error"
                    }
                    
                    
                }
            
            }
            
        }
        
        
    }
    
}

