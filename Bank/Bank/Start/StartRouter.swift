//
//  StartRouter.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

class StartRouter: PTRStart{
    func pushToRegister(nav: UINavigationController) {
        let vc = RegisterRouter.createRegisterModule()
        nav.pushViewController(vc, animated: true)
    }
    
    func pushToLogin(nav: UINavigationController){
        let vc = LoginRouter.createLoginModule()
        nav.pushViewController(vc, animated: true)
    }
    
    static func createStartModule() -> StartVC {
        let view = StartVC()
        let presenter = StartPresenter()
        let interactor: PTIStart = StartInteractor()
        let router: PTRStart = StartRouter()
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
