//
//  SaveBuySellRouter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 16/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SaveBuySellRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SaveBuySellDataPassing
{
  var dataStore: SaveBuySellDataStore? { get }
}

class SaveBuySellRouter: NSObject, SaveBuySellRoutingLogic, SaveBuySellDataPassing
{
  weak var viewController: SaveBuySellViewController?
  var dataStore: SaveBuySellDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SaveBuySellViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SaveBuySellDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
