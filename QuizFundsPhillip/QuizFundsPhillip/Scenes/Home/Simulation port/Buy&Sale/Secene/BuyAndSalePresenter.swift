//
//  BuyAndSalePresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 15/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BuyAndSalePresentationLogic
{
  func presentSomething(response: BuyAndSale.Something.Response)
}

class BuyAndSalePresenter: BuyAndSalePresentationLogic
{
  weak var viewController: BuyAndSaleDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: BuyAndSale.Something.Response)
  {
    let viewModel = BuyAndSale.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
