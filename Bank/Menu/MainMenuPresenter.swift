//
//  MainMenuPresenter.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

class MainMenuPresenter: VTPMainMenu{
    func startLogout(nav: UINavigationController) {
        interactor?.logOut(nav: nav)
    }
    
    
    var view: PTVMainMenu?
    
    var interactor: PTIMainMenu?
    
    var router: PTRMainMenu?
    
    func goToStart(nav: UINavigationController){
        router?.pushToStartMenu(nav: nav)
    }
    
}

extension MainMenuPresenter: ITPMainMenu{
    func logOutSucces(nav: UINavigationController) {
        self.goToStart(nav: nav)
    }
    
    func logOutFailed(message: String) {
        view?.showErrorMessage(message: message)
    }
    
    
}
