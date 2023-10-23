//
//  MainMenuVC.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import UIKit

class MainMenuVC: UIViewController {

  
  
  @IBOutlet weak var btnSignOut: UIButton!
  var presenter: VTPMainMenu?
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



  @IBAction func onClickSignOut(_ sender: Any) {
    presenter?.startLogout(nav: self.navigationController!)
  }
  func showAlert(message: String){
      let alert = UIAlertController(title: "Failed logout", message: message, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
      
  }
}

extension MainMenuVC: PTVMainMenu{
  func showErrorMessage(message: String) {
      showAlert(message: message)
  }
  
  
}
