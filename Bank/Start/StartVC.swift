//
//  StartVC.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import UIKit

class StartVC: UIViewController {

  
  @IBOutlet weak var btnRegister: UIButton!
  
  
  @IBOutlet weak var btnLogin: UIButton!
  var presenter: VTPStart?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  
  @IBAction func pushToRegister(_ sender: Any) {
  presenter?.goToRegister(nav: self.navigationController!)
    
  }
  
  @IBAction func pushToLogin(_ sender: Any) {
    presenter?.goToLogin(nav: self.navigationController!)
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension StartVC: PTVStart{
    
}
