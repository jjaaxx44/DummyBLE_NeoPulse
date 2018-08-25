//
//  HistoryVC.swift
//  DummyBLE_NeoPulse
//
//  Created by Abhishek Chaudhari on 25/08/18.
//  Copyright © 2018 Abhishek Chaudhari. All rights reserved.
//

import UIKit
import Charts

class HistoryVC: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var chartView: LineChartView!
    
    //MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        setChartValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        setChartValues()
    }
    func setupUI() {
        deviceImage.addBorder(cornerRadius: deviceImage.frame.width/2, borderColor: .clear, borderWidth: 1.0)
        deviceImage.backgroundColor = .greyishBG

        segmentControl.tintColor = .clear
        segmentControl.setTitleTextAttributes([
            NSAttributedStringKey.foregroundColor: UIColor.gray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)
            ], for: .normal)
        
        segmentControl.setTitleTextAttributes([
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)
            ], for: .selected)
        
        
        //chart UI
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.labelPosition = .bottom

        
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawLabelsEnabled = false

        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawLabelsEnabled = true
        
        chartView.chartDescription?.text = ""
        chartView.legend.enabled = false
        
        
        chartView.leftAxis.axisMinimum = 20
        chartView.leftAxis.axisMaximum = 90
        chartView.rightAxis.axisMinimum = 20
        chartView.rightAxis.axisMaximum = 90
        
        chartView.xAxis.valueFormatter = TimeValueFormatter()
    }


    func setChartValues(_ count : Int = 20) {

        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count))+60)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(values: values, label: nil)
        set1.colors = [UIColor.chartLine]
        set1.drawCircleHoleEnabled = false
        set1.circleRadius = 4.0
        set1.lineWidth = 1.5
        
        
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.maximumFractionDigits = 0
        fmt.groupingSeparator = ","
        fmt.decimalSeparator = "."

        set1.valueFormatter = CustomIntFormatter()
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
    }

    //MARK: - Actions
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


class CustomIntFormatter: NSObject, IValueFormatter{
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let correctValue = Int(value)
        return String(correctValue)
    }
}

public class TimeValueFormatter: NSObject, IAxisValueFormatter {
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let time:Int = Int(value*3)
        return String(format: "1:\(time)")
    }
}

