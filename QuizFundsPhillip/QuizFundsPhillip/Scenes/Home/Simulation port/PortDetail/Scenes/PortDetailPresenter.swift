//
//  PortDetailPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 25/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PortDetailPresentationLogic
{
  func presentDeleteData(response: PortDetail.DeletePort.Response)
    func presentFecthPortNo(response: PortDetail.PortNo.Response)
  
}


class PortDetailPresenter: PortDetailPresentationLogic
{
  weak var viewController: PortDetailDisplayLogic?
  
  // MARK: Do something
    func presentFecthPortNo(response: PortDetail.PortNo.Response) {
        let viewModel = PortDetail.PortNo.ViewModel(portno: response.portno)
        viewController?.displayFecthPortNo(viewModel: viewModel)
    }
        
  func presentDeleteData(response: PortDetail.DeletePort.Response)
  {
    let viewModel = PortDetail.DeletePort.ViewModel(delete: response.delete, error: response.error)
    viewController?.displayDeletePort(viewModel: viewModel)
  }
}
