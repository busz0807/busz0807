//
//  SimulationportModels.swift
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

enum Simulationport {
    // MARK: Use cases
    
    enum GetOrder {
      struct Request {
          var username: String
          var portNo: Int
          
      }
      struct Response {
          var getOrderDate: GetOrderModel?
          var error: Error?
      }
      struct ViewModel {
          var getOrderDate: GetOrderModel?
          var error: Error?
      }
    }
      enum GetOrder2 {
        struct Request {
            var username: String
            var portNo: Int
            
        }
        struct Response {
          var getOrderDate2: GetOrderModel?
            var error: Error?
        }
        struct ViewModel {
          var getOrderDate2: GetOrderModel?
            var error: Error?
        }
      }
      enum GetOrder3 {
        struct Request {
            var username: String
            var portNo: Int
            
        }
        struct Response {
          var getOrderDate3: GetOrderModel?
            var error: Error?
        }
        struct ViewModel {
          var getOrderDate3: GetOrderModel?
            var error: Error?
        }
      }
      enum GetOrder4 {
        struct Request {
            var username: String
            var portNo: Int
            
        }
        struct Response {
          var getOrderDate4: GetOrderModel?
            var error: Error?
        }
        struct ViewModel {
          var getOrderDate4: GetOrderModel?
            var error: Error?
        }
      }
      enum GetOrder5 {
        struct Request {
            var username: String
            var portNo: Int
            
        }
        struct Response {
          var getOrderDate5: GetOrderModel?
            var error: Error?
        }
        struct ViewModel {
          var getOrderDate5: GetOrderModel?
            var error: Error?
        }
      }
  }