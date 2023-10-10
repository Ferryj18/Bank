//
//  LoginRouter.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

class LoginRouter: PTRLogin {
    // MARK: Login Module
    static func createLoginModule() -> LoginVC {
        let view = LoginVC()
        let presenter = LoginPresenter()
        let interactor: PTILogin = LoginInteractor()
        let router: PTRLogin = LoginRouter()
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    // MARK: Navigation Function
    func pushToRegister(nav: UINavigationController) {
        let vc = RegisterRouter.createRegisterModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: false)
    }
    
    func pushToMenu(nav: UINavigationController) {
        let vc = MainMenuRouter.createMainMenuModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
}
