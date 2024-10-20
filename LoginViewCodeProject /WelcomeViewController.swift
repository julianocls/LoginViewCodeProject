//
//  SceneDelegate.swift
//  TimerProject
//
//  Created by Juliano Santos on 19/10/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    weak var coordinator: LoginCoordinator?

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Seja bem-vindo a esta tela"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white  // Cor do texto
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.orange, for: .normal)  // Cor do texto
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }

    private func setupUI() {
        // Definindo o fundo laranja, similar ao login
        view.backgroundColor = UIColor(red: 243/255, green: 119/255, blue: 37/255, alpha: 1)

        view.addSubview(welcomeLabel)
        view.addSubview(backButton)

        // Configuração das restrições
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            backButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        // Voltar para a tela de login
        navigationController?.popViewController(animated: true)
    }

}
