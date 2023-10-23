//
//  MainMenuRouter.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

class MainMenuRouter: PTRMainMenu{
    func pushToStartMenu(nav: UINavigationController) {
        let vc = StartRouter.createStartModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: true)
    }
    
    static func createMainMenuModule() -> MainMenuVC {
        let view = MainMenuVC()
        let presenter = MainMenuPresenter()
        let interactor: PTIMainMenu = MainMenuInteractor()
        let router: PTRMainMenu = MainMenuRouter()
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    
    
    
}
