//
//  ViewController.swift
//  START-HW20
//
//  Created by Adlet Zhantassov on 04.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardManaCost: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cardSetName: UILabel!
    @IBOutlet weak var loadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        loadingLabel.isHidden = true
    }
    
    @IBAction func getOPT(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        loadingLabel.isHidden = false
        
        API.callAPI(scheme: Endpoint.scheme, host: Endpoint.host, path: Endpoint.path, queryItems: [URLQueryItem(name: "name", value: "Opt"), URLQueryItem(name: "pageSize", value: "1")]) { [weak self] firstCard in
            
            guard let self = self else { return }
            print(firstCard)
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.loadingLabel.isHidden = true
                self.cardName.text = "Имя карты: \(firstCard.name)"
                self.cardType.text = "Тип: \(firstCard.type)"
                self.cardManaCost.text = "Мановая стоимость: \(firstCard.manaCost)"
                self.cardSetName.text = "Название сета: \(firstCard.setName)"
            }
        }
    }
    
    @IBAction func getBlackLotus(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        loadingLabel.isHidden = false
        
        API.callAPI(scheme: Endpoint.scheme, host: Endpoint.host, path: Endpoint.path, queryItems: [URLQueryItem(name: "name", value: "Black Lotus")]) { [weak self] firstCard in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.loadingLabel.isHidden = true
                self.cardName.text = "Имя карты: \(firstCard.name)"
                self.cardType.text = "Тип: \(firstCard.type)"
                self.cardManaCost.text = "Мановая стоимость: \(firstCard.manaCost)"
                self.cardSetName.text = "Название сета: \(firstCard.setName)"
            }
        }
    }
}

