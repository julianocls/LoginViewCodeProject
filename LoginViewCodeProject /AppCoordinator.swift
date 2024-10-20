//
//  SceneDelegate.swift
//  TimerProject
//
//  Created by Juliano Santos on 19/10/24.
//

import UIKit

class AppCoordinator: LoginCoordinator {
    
    var window: UIWindow?

    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        
        // Inicializa o UINavigationController com o LoginViewController
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func loginButtonTapped(_ username: String, _ password: String) {
        print("Botão login pressionado! Logando usuario \(username) com a senha \(password)")

        // Apresentar a nova tela de boas-vindas
        let welcomeVC = WelcomeViewController()
        welcomeVC.coordinator = self
        if let navigationController = window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(welcomeVC, animated: true)

        }
    }
    
    func showForgotPassword() {
        // Navegar para a tela de "Esqueci minha senha"
        print("Esqueci minha senha...")
    }
}
