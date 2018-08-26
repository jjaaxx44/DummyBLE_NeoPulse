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
    
    @IBOutlet weak var heartRateDataLabel: UILabel!
    @IBOutlet weak var respirationDataLabel: UILabel!
    @IBOutlet weak var tempratureDataLabel: UILabel!
    @IBOutlet weak var stepsDataLabel: UILabel!
    
    var bleDataViewModel = BLEDataViewModel(bleData: BLEDataMadel())
    
    //MARK: - View cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        fakeBLEDataFetch()
        
        bleDataViewModel.heartRateString.bind{
            self.heartRateDataLabel.text = $0
        }
        bleDataViewModel.respirationString.bind{
            self.respirationDataLabel.text = $0
        }
        bleDataViewModel.skinTempratureString.bind{
            self.tempratureDataLabel.text = $0
        }
        bleDataViewModel.stepsString.bind{
            self.stepsDataLabel.text = $0
        }
    }
    
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
    
    //MARK: - BLE
    //fakeBLEDataFetch instead of getting data in didUpdateValueFor for service enabled characteristic
    func fakeBLEDataFetch(){ //
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
            let fakeBLEData = BLEDataMadel()
            fakeBLEData.heartRate = String(format: "%.f", Double(arc4random_uniform(UInt32(20))+60))
            fakeBLEData.respiration = String(format: "%.f", Double(arc4random_uniform(UInt32(4))+14))
            fakeBLEData.skinTemprature = String(format: "%.2f", Double(arc4random_uniform(UInt32(4))+36))
            fakeBLEData.steps = "7896"
            
            self.bleDataViewModel.data = fakeBLEData
        }
    }
}

