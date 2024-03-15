//
//  ViewController.swift
//  database
//
//  Created by Bekarys Sandigali on 13.03.2024.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var labels:Array = [String]()
    lazy var textInput:UITextField = {
       let input = UITextField()
        input.textInputView.backgroundColor = .white
        input.layer.borderWidth = 2
        input.layer.cornerRadius = 16
        input.placeholder = "Enter your text please!"
        input.layer.borderColor = UIColor.black.cgColor
        return input
    }()
    lazy var label:UILabel = {
        let label = UILabel()
        label.text = "\(labels)"
        label.textColor = .black
        return label
    }()
    lazy var button : UIButton = {
       let button = UIButton()
        button.setTitle("Press",for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 16
        button.addTarget(self, action:#selector(tapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        saveName()

    }
    
    func setUp(){
        view.addSubview(textInput)
        view.addSubview(label)
        view.addSubview(button)
        
        //constraint
        textInput.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(60)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(textInput.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
     
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
    }
    @objc func tapped() {
        if let text = textInput.text, !text.isEmpty {
            labels.append(textInput.text!)
//            let addSymvol = labels.isEmpty ? text : ",\(text)"
            textInput.text = ""
            label.text = labels.joined(separator: ",")
            label.numberOfLines = 0
            UserDefaults.standard.set(labels, forKey: "Labels")
//            let getNames = UserDefaultManager.shared.getNames()
//            print(getNames)
        } else {
           let alert =  UIAlertController(title: "No text", message: "There is no text to add!", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
                print("Alert tapped")
            }

            // Add the Yes action to the UIAlertController
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
    }
    func saveName(){
        if let savedLabels = UserDefaults.standard.array(forKey: "Labels") as? [String] {
                labels = savedLabels
                label.text = labels.joined(separator: ",")
            }
            
    }


}

