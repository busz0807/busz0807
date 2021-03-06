//
//  FundsIPOViewController.swift
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

protocol FundsIPODisplayLogic: class
{
    func displayFetchFromLocalDataStore(viewModel: FundsIPO.FetchFromLocalDataStore.ViewModel)
}

class FundsIPOViewController: UIViewController, FundsIPODisplayLogic
{
    @IBOutlet weak var lbFundcode: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbDesciption: UILabel!
    @IBOutlet weak var setView: UIView!
    @IBOutlet weak var lbIPORollover: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var setViewRisk: UIView!
    @IBOutlet weak var setViewChange: UIView!
    @IBOutlet weak var lbRisk: UILabel!
    @IBOutlet weak var lbChange: UILabel!
    @IBOutlet weak var setViewInvestment: UIView!
    @IBOutlet weak var lbInvestment: UILabel!
    @IBOutlet weak var setDuration: UIView!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbReward: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    @IBOutlet weak var setViewbtn: UIView!
    @IBAction func btnBuyFund(_ sender: Any) {
        didSelectFormCell()
    }
  var interactor: FundsIPOBusinessLogic?
    var fundsIPOData: FundIPORolloverDataModels?
  var router: (NSObjectProtocol & FundsIPORoutingLogic & FundsIPODataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = FundsIPOInteractor()
    let presenter = FundsIPOPresenter()
    let router = FundsIPORouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setupFetchFromLocalDataStore()
    self.setView.clipsToBounds = true
    self.setView.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setView.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setView.layer.shadowRadius = 5
    self.setView.layer.masksToBounds = false
    
    self.setViewRisk.clipsToBounds = true
    self.setViewRisk.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewRisk.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setViewRisk.layer.shadowRadius = 5
    self.setViewRisk.layer.masksToBounds = false
    
    self.setViewChange.clipsToBounds = true
    self.setViewChange.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewChange.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setViewChange.layer.shadowRadius = 5
    self.setViewChange.layer.masksToBounds = false
    
    self.setViewInvestment.clipsToBounds = true
    self.setViewInvestment.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewInvestment.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setViewInvestment.layer.shadowRadius = 5
    self.setViewInvestment.layer.masksToBounds = false
    
    self.setDuration.clipsToBounds = true
    self.setDuration.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setDuration.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setDuration.layer.shadowRadius = 5
    self.setDuration.layer.masksToBounds = false
    
    self.setViewbtn.clipsToBounds = true
    self.setViewbtn.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setViewbtn.layer.shadowOffset = CGSize(width: 0, height: 20)
    self.setViewbtn.layer.shadowRadius = 5
    self.setViewbtn.layer.masksToBounds = false
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
    func setupFetchFromLocalDataStore() {
      let request = FundsIPO.FetchFromLocalDataStore.Request()
      interactor?.setupFetchFromLocalDataStore(request: request)
    }
    
    func displayFetchFromLocalDataStore(viewModel: FundsIPO.FetchFromLocalDataStore.ViewModel) {
    //nameTextField.text = viewModel.name
        self.fundsIPOData = viewModel.iPOData
//        print("data!!>>",self.fundsIPOData)
         self.lbFundcode.text = self.fundsIPOData?.fundcode
        let imageURL = self.fundsIPOData?.lgpic ?? ""
        let url = URL(string: imageURL)
        self.imgView.sd_setImage(with: url,  placeholderImage: UIImage(named: "Image"))
        self.lbDesciption.text = self.fundsIPOData?.chnfname ?? ""
        self.lbIPORollover.text = self.fundsIPOData?.ipoRollOver ?? ""
        self.lbDate.text = "\(self.fundsIPOData?.ipoOfferDate ?? "") - \(self.fundsIPOData?.ipoExpireDate ?? "")"
      let  risk = self.fundsIPOData?.risklevel ?? 0
        self.lbRisk.text = String(risk)
        let risktxt = self.fundsIPOData?.fxRisk ?? ""

        if risktxt == "Y" {
            self.lbChange.text = "??????????????????"
        }else {
            self.lbChange.text = "???????????????????????????"
        }
        let ipoInvestment = self.fundsIPOData?.ipoInvestment ?? 0
        self.lbInvestment.text = String(ipoInvestment)
        self.lbDuration.text = self.fundsIPOData?.ipoDuration ?? ""
        self.lbReward.text = self.fundsIPOData?.ipoReward ?? ""
        self.lbDetail.text = self.fundsIPOData?.ipoDetails ?? ""
  }
    func didSelectFormCell() {
      
        let alert = UIAlertController(title: "?????????????????????????????????????????????????????????", message: "???????????????????????????????????????????????????????????????????????????????????????????????? ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                          //Cancel Action
                      }))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
       
        self.present(alert, animated: true, completion: nil)
    }
}
