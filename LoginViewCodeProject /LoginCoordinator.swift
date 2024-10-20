//
//  SceneDelegate.swift
//  TimerProject
//
//  Created by Juliano Santos on 19/10/24.
//

import UIKit

protocol LoginCoordinator: AnyObject {
    func loginButtonTapped(_ username: String, _ password: String)
    func showForgotPassword()
}
