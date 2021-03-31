//
//  ChangePresenter.swift
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

protocol ChangePresentationLogic
{
  func presentSomething(response: Change.Something.Response)
}

class ChangePresenter: ChangePresentationLogic
{
  weak var viewController: ChangeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Change.Something.Response)
  {
    let viewModel = Change.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
