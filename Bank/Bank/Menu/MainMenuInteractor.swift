//
//  MainMenuInteractor.swift
//  Bank
//
//  Created by Ferry jati on 10/10/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class MainMenuInteractor: PTIMainMenu{
    
    var presenter: ITPMainMenu?
    
    func logOut(nav: UINavigationController) {
        do {
            try Auth.auth().signOut()
            self.presenter?.logOutSucces(nav: nav)
        } catch  {
            self.presenter?.logOutFailed(message: "Error when Log out")
        }
    }
    
}
