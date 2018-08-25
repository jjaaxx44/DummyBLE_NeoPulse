//
//  ViewController.swift
//  DummyBLE_NeoPulse
//
//  Created by Abhishek Chaudhari on 25/08/18.
//  Copyright © 2018 Abhishek Chaudhari. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {

    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet weak var deviceImage: UIImageView!
    
    @IBOutlet weak var takeHRButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    //MARK: - View cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        historyButtonClicked(UIButton())
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        mainContainerView.backgroundColor = .white
        mainContainerView.addBorder(cornerRadius: 10.0, borderColor: .clear, borderWidth: 1.0)
        self.view.backgroundColor = .greyishBG
        
        deviceImage.addBorder(cornerRadius: deviceImage.frame.width/2, borderColor: .clear, borderWidth: 1.0)
        deviceImage.backgroundColor = .greyishBG
        
        takeHRButton.addBorder(cornerRadius: 10.0, borderColor: .clear, borderWidth: 1.0)
        takeHRButton.backgroundColor = .blueHR
    }
    
    //MARK: - Actions

    @IBAction func historyButtonClicked(_ sender: Any) {
        let historyVC = HistoryVC(nibName: "HistoryVC", bundle: nil)
        self.navigationController?.pushViewController(historyVC, animated: true)
    }
}

