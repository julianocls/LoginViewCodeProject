//
//  SceneDelegate.swift
//  TimerProject
//
//  Created by Juliano Santos on 19/10/24.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - UI Elements
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Usuário"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        // Estilizando o campo de texto com ícone e borda arredondada
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.white.cgColor  // Borda branca para contraste
        textField.setLeftPaddingPoints(45)  // Aumenta o espaço à esquerda para o ícone
        // Adiciona o ícone de "bonequinho"
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.tintColor = .gray
        imageView.frame = CGRect(x: 5, y: 5, width: 20, height: 20)  // Ajusta a posição e o tamanho do ícone
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        containerView.addSubview(imageView)
        textField.leftView = containerView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        // Estilizando o campo de texto com ícone e borda arredondada
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.white.cgColor  // Borda branca para contraste
        textField.setLeftPaddingPoints(40)  // Espaço maior para o ícone
        // Adiciona o ícone de "cadeado"
        let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
        imageView.tintColor = .gray
        imageView.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        containerView.addSubview(imageView)
        textField.leftView = containerView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.orange, for: .normal)  // Texto laranja para fundo branco
        button.backgroundColor = .white  // Fundo branco
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.orange.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rememberMeCheckbox: UISwitch = {
        let checkbox = UISwitch()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.onTintColor = UIColor.orange  // Cor laranja para contrastar
        return checkbox
    }()
    
    private let rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Lembrar de mim"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white  // Cor branca para contraste
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Esqueci minha senha", for: .normal)
        button.setTitleColor(.white, for: .normal)  // Cor branca para contraste
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Coordinator
    weak var coordinator: LoginCoordinator?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
    }

    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = UIColor(red: 243/255, green: 119/255, blue: 37/255, alpha: 1)  // Cor laranja vibrante
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(rememberMeCheckbox)
        view.addSubview(rememberMeLabel)
        view.addSubview(forgotPasswordButton)
    }

    private func setupActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped(){
        guard let username = usernameTextField.text, !username.isEmpty else {
            showError("Usuário não pode estar vazio!")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showError("Password não pode estar vazio!")
            return
        }
        coordinator?.loginButtonTapped(username, password)
    }
    
    // MARK: - Actions
    @objc private func forgotPasswordTapped() {
        coordinator?.showForgotPassword()
    }

    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            
            rememberMeCheckbox.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            rememberMeCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeCheckbox.centerYAnchor),
            rememberMeLabel.leadingAnchor.constraint(equalTo: rememberMeCheckbox.trailingAnchor, constant: 10),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: rememberMeCheckbox.bottomAnchor, constant: 20),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.layoutIfNeeded()
    }
    
    private func showError(_ message: String) {
        let customAlert = CustomAlertViewController()
        customAlert.modalPresentationStyle = .overFullScreen
        customAlert.modalTransitionStyle = .crossDissolve
        present(customAlert, animated: true, completion: nil)
    }
}

// Extensão para adicionar espaçamento interno no UITextField
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
