//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Артём Кармазь on 12/20/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // let's avoid polluting viewDidLoad
    // {} is refferes to as closure or anon. functions
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_brown"))
        // this enable autolayout for our image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // create view text filds with labels
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join to our army of brown bears!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSAttributedString(string: "We are fluffy, we can be ironed and we have cookies. Every day we will cuddle. Join us.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
//        textView.text = "Join to our army of brown bears!"
//        textView.font = UIFont.boldSystemFont(ofSize: 24)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // entry point into app
        //        view.backgroundColor = .yellow
        
        //        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_brown"))
        
//        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
//        setupView()
        setupLayout()
        
        //        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //        // this enable autolayout for our image view
        //        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        //        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // up image up on 100 pixels
        //        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    private func setupLayout() {
        // added blue
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .yellow
        view.addSubview(topImageContainerView)
//        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
//        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        // setup layout image bear
//        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // setup layout description text
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
//    private func setupView() {
//        view.backgroundColor = .white
//    }
}

