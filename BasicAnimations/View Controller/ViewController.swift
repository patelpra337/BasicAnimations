//
//  ViewController.swift
//  BasicAnimations
//
//  Created by patelpra on 6/24/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var label: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.configureRedView()
        self.configureLabel()
        self.configureButtons()
    }
    // Do any additional setup after loading the view.
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.label.center = self.view.center
    }
    
    func configureRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add it to the view controller's view
        self.view.addSubview(redView)
        
        // Constrain it
        // NSLayoutConstraint API
        //        let redLeadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 30)
        //
        //        let redBottomConstraint = NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        //
        //        let redHeightConstraint = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        //
        //        let redAspectRationConstraints = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1, constant: 0)
        let redLeadingConstraint = redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let redBottomConstraint = redView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let redHeightConstraint = redView.heightAnchor.constraint(equalToConstant: 100)
        let redViewAspectRatioConstraint = redView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate(
            
            [redLeadingConstraint,redBottomConstraint,redHeightConstraint,redViewAspectRatioConstraint]
        )
    }
    
    func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 12
        
        label.text = "🧛🏿‍♀️"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
    }
    
    func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotateButton)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyButton)
        keyButton.setTitle("key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(springButton)
        springButton.setTitle("spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let squashButton = UIButton(type: .system)
        squashButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squashButton)
        squashButton.setTitle("squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        
        let anticButton = UIButton(type: .system)
        anticButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(anticButton)
        anticButton.setTitle("antic", for: .normal)
        anticButton.addTarget(self, action: #selector(anticButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(squashButton)
        stackView.addArrangedSubview(anticButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
            ])
    }
    
    @objc func rotateButtonTapped() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                self.label.transform = .identity
            })
        }
    }
    
    @objc func keyButtonTapped() {
        label.center = self.view.center
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.label.transform = .identity
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.label.center = self.view.center
            })
        }, completion: nil)
    }
    
    @objc func springButtonTapped() {
        label.center = self.view.center
        
        self.label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc func squashButtonTapped() {
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                self.label.center = self.view.center
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15, animations: {
                self.label.transform = .identity
            })
            
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations:
            animBlock, completion: nil)
    }
    
    @objc func anticButtonTapped() {
        self.label.center = self.view.center
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1) {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 16.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.label.center = CGPoint(x: self.view.bounds.size.width +
                    self.label.bounds.size.width, y: self.view.center.y)
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: animBlock, completion: nil)
        
    }
    
    // MARK:  - Actions and Animations
}

