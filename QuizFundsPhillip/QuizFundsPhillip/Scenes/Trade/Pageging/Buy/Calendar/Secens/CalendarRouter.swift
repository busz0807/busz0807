//
//  CalendarRouter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 16/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CalendarRoutingLogic {
    func goToback(dateData: String)
}

protocol CalendarDataPassing {
  var dataStore: CalendarDataStore? { get }
}

class CalendarRouter: NSObject, CalendarRoutingLogic, CalendarDataPassing {
  
    
  weak var viewController: CalendarViewController?
  var dataStore: CalendarDataStore?
  
  // MARK: Routing
  
    func goToback(dateData: String) {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TradeViewController") as! TradeViewController
        var destinationDS = destinationVC.router!.dataStore!
        destinationDS.date = dateData 
//        viewController?.navigationController?.popViewController(animated: true)
        viewController?.dismiss(animated: true)
    }
}
