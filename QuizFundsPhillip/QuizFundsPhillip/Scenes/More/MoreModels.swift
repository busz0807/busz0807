//
//  MoreModels.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 28/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum More
{
  // MARK: Use cases
  
    enum FetchAnalystReportDataStore {
      struct Request {
          var nameAnalystReport: String
      }
      struct Response {
          var analystReportData: [AnalystReportModel]?
          var error: Error?
      }
      struct ViewModel {
          var analystReportData: [AnalystReportModel]?
          var error: Error?
      }
    }
}
