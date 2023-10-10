//
//  StartPresenter.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

class StartPresenter: VTPStart {
  var view: PTVStart?
  
  var interactor: PTIStart?
  
  var router: PTRStart?
  func goToRegister(nav: UINavigationController) {
    router?.pushToRegister(nav: nav)
  }
  
  func goToLogin(nav: UINavigationController) {
    router?.pushToLogin(nav: nav)
  }
  
  
    
}
  extension StartPresenter: ITPStart {
}
