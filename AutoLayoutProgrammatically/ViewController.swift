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
        return imageView
    }()
    
    // create view text filds with labels
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Join to our army of brown bears!"
        textView.font = UIFont.boldSystemFont(ofSize: 24)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .yellow
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
        
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        setupView()
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
        // setup layout image bear
        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // setup layout description text
        descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    private func setupView() {
        view.backgroundColor = .yellow
    }
}

