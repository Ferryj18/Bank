//
//  LoginVC.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import UIKit
import LocalAuthentication
import FirebaseAuth
import CoreData

class LoginVC: UIViewController {

  
  @IBOutlet weak var txtEmail: UITextField!
  
  @IBOutlet weak var txtPassword: UITextField!
  
  @IBOutlet weak var btnRegister: UIButton!
  
  @IBOutlet weak var btnLogin: UIButton!
  
  
  var email,password: String?
  var presenter: VTPLogin?
  var hideUnhide: Bool? = true
  
  override func viewDidLoad() {
      super.viewDidLoad()
      setUpView()
      setUpAction()
  }
  
  func setUpView(){
      btnRegister.setTitle("Register", for: .normal)
      btnLogin.setTitle("Login", for: .normal)
  }
  
  func setUpAction(){
      btnLogin.addTarget(self, action: #selector(OnClickLogin), for: .touchUpInside)
      btnRegister.addTarget(self, action: #selector(OnClicRegister), for: .touchUpInside)
  }
  
  @objc func OnClickLogin(_ sender: Any){
      let error = validateFields()
      email = txtEmail.text?.trim(.whitespacesAndNewlines)
      password = txtPassword.text?.trim(.whitespacesAndNewlines)
      
      if error != nil{
          PopupAlert.shared.showAlert(title: "Error", message: error!, btnTitle: "OK")
      }else{
          deleteLoginData()
          presenter?.startLogin(nav: self.navigationController!, email: email!, password: password!)
      }
  }
  
  @objc func OnClicRegister(_ sender: Any){
      presenter?.goToRegister(nav: self.navigationController!)
  }
  
  
  
  
  
}

extension LoginVC {
  // MARK: Validation Login
  func validateFields() -> String?{
      var message = ""
      if email == "" || password == "" {
          message = "Please Fill Empety Field"
      }
      return message
  }
 
  func saveLoginData(){
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

      // Create a new User object
      let user = User(context: context)
      user.email = txtEmail.text
      user.password = txtPassword.text

      // Save the context
      do {
          try context.save()
      } catch let error as NSError {
          PopupAlert.shared.showAlert(title: "Error", message: "Error Save Data", btnTitle: "OK")
      }
  }
  
  func fetchLoginData(){
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

      // Fetch the User objects
      let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
      fetchRequest.fetchLimit = 1
      do {
          let results = try context.fetch(fetchRequest)
          if let firstResult = results.first {
              txtEmail.text = firstResult.email
              txtPassword.text = firstResult.password
              let logEmail = txtEmail.text?.trim(.whitespacesAndNewlines)
              let logPassword = txtPassword.text?.trim(.whitespacesAndNewlines)
              if let nav = navigationController {
                  presenter?.startLogin(nav: nav, email: logEmail!, password: logPassword!)
              }
              
          } else {
              PopupAlert.shared.showAlert(title: "Error", message: "No Data Retrived", btnTitle: "OK")
          }
      } catch let error as NSError {
          PopupAlert.shared.showAlert(title: "Error", message: "Could Not Fetch", btnTitle: "OK")
          print("Could not fetch. \(error), \(error.userInfo)")
      }
  }
  
  func deleteLoginData(){
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
      let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
      do {
          let users = try context.fetch(fetchRequest)
          for user in users {
              context.delete(user)
          }
      } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
      }
      saveLoginData()
  }
  
}

extension LoginVC: PTVLogin{
  func showErrorMessage(message: String) {
      PopupAlert.shared.showAlert(title: "Error", message: message, btnTitle: "OK")
  }
  
}
