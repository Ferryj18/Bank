//
//  MainMenuProtocol.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit

protocol PTVMainMenu: AnyObject{
    func showErrorMessage(message: String)
}

protocol VTPMainMenu: AnyObject{
    var view: PTVMainMenu? {get set}
    var interactor: PTIMainMenu? {get set}
    var router: PTRMainMenu? {get set}
    
    func startLogout(nav: UINavigationController)
}

protocol ITPMainMenu: AnyObject{
    func logOutSucces(nav: UINavigationController)
    func logOutFailed(message: String)
}

protocol PTIMainMenu: AnyObject{
    var presenter: ITPMainMenu? {get set}
    
    func logOut(nav: UINavigationController)
    
}

protocol PTRMainMenu: AnyObject{
    static func createMainMenuModule() -> MainMenuVC
    func pushToStartMenu(nav: UINavigationController)
}

