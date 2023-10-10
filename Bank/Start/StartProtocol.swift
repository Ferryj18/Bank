//
//  StartProtocol.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//
import Foundation
import UIKit

protocol PTVStart: AnyObject{
  
}

protocol VTPStart: AnyObject{
  var view: PTVStart? {get set}
  var interactor: PTIStart? {get set}
  var router: PTRStart? {get set}
  
  func goToRegister(nav: UINavigationController)
  func goToLogin(nav: UINavigationController)
  
}

protocol PTIStart: AnyObject{
var presenter: ITPStart? {get set}
}

protocol ITPStart: AnyObject{
}
protocol PTRStart: AnyObject{
  static func createStartModule() -> StartVC
  func pushToLogin(nav: UINavigationController)
  func pushToRegister(nav: UINavigationController)
}
