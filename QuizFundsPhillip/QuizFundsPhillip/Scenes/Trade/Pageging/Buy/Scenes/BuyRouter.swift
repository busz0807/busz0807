//
//  BuyRouter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 8/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BuyRoutingLogic {
    func goToSearchFundsPreview(mainpage:String)
    func goToPayMentPreview(picefunds: String,enName: String, thName: String, risk: String, date: String)

    

}

protocol BuyDataPassing {
  var dataStore: BuyDataStore? { get }
}

class BuyRouter: NSObject, BuyRoutingLogic, BuyDataPassing {

weak var viewController: BuyViewController?
  var dataStore: BuyDataStore?
  
  // MARK: Routing
  
    func goToSearchFundsPreview(mainpage:String) {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchFundsViewController") as! SearchFundsViewController
       var destinationDS = destinationVC.router!.dataStore!
       destinationDS.mainpage = mainpage
       viewController?.present(destinationVC, animated: true)
    }

    func goToPayMentPreview(picefunds: String,enName: String, thName: String, risk: String, date: String){
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        var destinationDS = destinationVC.router?.dataStore
        destinationDS?.picefunds = picefunds
        destinationDS?.enName = enName
        destinationDS?.thName = thName
        destinationDS?.risk = risk
        destinationDS?.date = date
        viewController?.present(destinationVC, animated: true)
    }

}
