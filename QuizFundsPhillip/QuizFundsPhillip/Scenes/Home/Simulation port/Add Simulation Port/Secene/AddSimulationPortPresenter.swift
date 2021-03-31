//
//  AddSimulationPortPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 9/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AddSimulationPortPresentationLogic
{
  func presentSomething(response: AddSimulationPort.Something.Response)
}

class AddSimulationPortPresenter: AddSimulationPortPresentationLogic
{
  weak var viewController: AddSimulationPortDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: AddSimulationPort.Something.Response)
  {
    let viewModel = AddSimulationPort.Something.ViewModel(searchfunds: response.searchfunds)
    viewController?.displaySomething(viewModel: viewModel)
  }
}