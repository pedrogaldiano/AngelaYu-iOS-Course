//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    @IBOutlet var bitcoinLabel: UILabel!
    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

//MARK: - CoinManagerDelegate
extension  ViewController: CoinManagerDelegate {
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    func updateCoinRate(_ coinManager: CoinManager, _ response: Response) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.4f", response.rate)
            self.currencyLabel.text = response.asset_id_quote
        }
    }
    
    
}


//MARK: - PickerView
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let coin = coinManager.getCoinName(for: row)
        coinManager.getCoinPrice(for: coin)
    }
}
