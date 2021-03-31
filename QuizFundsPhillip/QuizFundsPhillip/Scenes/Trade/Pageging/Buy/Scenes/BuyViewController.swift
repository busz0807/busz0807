//
//  BuyViewController.swift
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
import RealmSwift
import FSCalendar

enum NotificationCenterSearch: String {
    case Clicked
}
enum NotificationCenterPayment: String {
    case Clicked
}
protocol BuyDisplayLogic: class
{
    func displaymoneyfunds(viewModel: Buy.FetchMoneyData.ViewModel)
}

class BuyViewController: UIViewController, BuyDisplayLogic {
    // MARK: IBAction
    @IBAction func btndate(_ sender: Any) {
        // MARK: setViewCalendar
        self.setViewCalendar.backgroundColor = .white
        self.setViewCalendarSecond.backgroundColor = .white
        self.setViewCalendar.clipsToBounds = true
        self.setViewCalendar.layer.cornerRadius = 10
        self.setViewCalendar.layer.shadowColor = UIColor.systemGray.cgColor
        self.setViewCalendar.layer.shadowOpacity = 0.5
        self.setViewCalendar.layer.shadowRadius = 10
        self.setViewCalendar.layer.masksToBounds = false
        // MARK: setbtnCloseCalendar
        self.setbtnCloseCalendar.setImage( UIImage(named: "cancel"), for: .normal)
        // MARK: calendar
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 274, height: 295))
        setViewCalendarSecond.addSubview(calendar)
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearance.titleWeekendColor = UIColor.red
        self.calendar = calendar
        self.tableView.reloadData()
    }
    // MARK: btn Calendar
    @IBAction func btnCloseCalendar(_ sender: Any) {
        if self.date == "" {
        self.setViewCalendar.backgroundColor = .clear
        calendar.removeFromSuperview()
        self.setViewCalendarSecond.backgroundColor = .clear
        self.setbtnCloseCalendar.setImage( UIImage(named: ""), for: .normal)
            
        self.tableView.reloadData()
        }else {
            self.setViewCalendar.backgroundColor = .clear
            self.calendar.removeFromSuperview()
            self.setViewCalendarSecond.backgroundColor = .clear
            self.setbtnCloseCalendar.setImage( UIImage(named: ""), for: .normal)
            calendar.removeFromSuperview()
            self.tableView.reloadData()
        }
    }
    // MARK: btn Payment
    @IBAction func btnpayment(_ sender: Any) {
        print("btnpayment")
        router?.goToPayMentPreview(picefunds: self.piceFunds, enName: self.enName, thName: self.thName, risk: self.risk, date: self.date)
        
        self.tableView.reloadData()
    }
    // MARK: btn Delete Funds
    @IBOutlet weak var setbtnDeleteFunds: UIButton!
    @IBAction func btnDeleteFunds(_ sender: Any) {
        let createMenu = UIAlertController(title: nil, message: "คุณต้องการจะลบกองทุนใช้ไหม", preferredStyle: .actionSheet)
    
        let delete = UIAlertAction(title: "Delete", style: .default, handler: {(_) in
        
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
            self.setbtnpayment.setTitle("โปรดระบุ", for: .normal)
            self.numBath.text = "0"
            self.lbFunds.text = "กองทุนในตระกร้า (0)"
            self.viewbtn.backgroundColor = .gray
            self.delete = "1"
            self.tableView.reloadData()
           
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        createMenu.addAction(delete)
        createMenu.addAction(cancelAction)
        self.present(createMenu, animated: true, completion: nil)
       
    }
    @IBOutlet weak var setViewCalendarSecond: UIView!
    @IBOutlet weak var setbtnCloseCalendar: UIButton!
    // MARK: btn Choose Funds
    @IBOutlet weak var setbtnChooseFunds: UIButton!
    @IBAction func btnHideChooseFunds(_ sender: Any) {
        router?.goToSearchFundsPreview(mainpage: "Buy")
    }
    @IBAction func btnSearchFunds(_ sender: Any) {
  
        router?.goToSearchFundsPreview(mainpage: "Buy")
     
    }
    @IBAction func btnChooseFunds(_ sender: Any) {
        router?.goToSearchFundsPreview(mainpage: "Buy")
    }
    // MARK: btn Confirm Buy Funds
    @IBAction func btnconfirmfunds(_ sender: Any) {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        let money = numberformatter.number(from: self.money ?? "")?.intValue ?? 0
        let piceFunds = numberformatter.number(from: self.piceFunds)?.intValue ?? 0
        let dataFormattertoday = DateFormatter()
        dataFormattertoday.dateFormat = "dd/MM/yyyy"
        let formattedDatetoday = dataFormattertoday.string(from: Date())
        let today = formattedDatetoday
        if self.enName != "" {
            self.setViewCalendar.backgroundColor = .clear
            self.setViewCalendarSecond.backgroundColor = .clear
            self.setbtnCloseCalendar.setImage( UIImage(named: ""), for: .normal)
            self.tableView.reloadData()
        }else {
            self.setViewCalendar.backgroundColor = .clear
            self.setViewCalendarSecond.backgroundColor = .clear
            self.setbtnCloseCalendar.setImage( UIImage(named: ""), for: .normal)
            self.tableView.reloadData()
        }
        if piceFunds > money {
           let alert = UIAlertController(title: "ขออภัย", message: "จำนวนเงินไม่พอกรุณาเติมเงิน", preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
        }else  if self.payment == "โปรดระบุ"{
            let alert = UIAlertController(title: "ขออภัย", message: "โปรดเลือกช่องทางการชำระเงิน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if self.piceFunds == "" {
        let alert = UIAlertController(title: "", message: "โปรดเลือกกองทุน", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }else if  self.payment != "Pay-in" {
            let alert = UIAlertController(title: "", message: "ชำระเงินเสร็จสมบรูณ์", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("money",self.money ?? "")
            sendclick(moneyupdate: self.money ?? "")
            self.piceFunds = ""
            self.date = ""
            self.risk = ""
            self.enName = ""
            self.thName = ""
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
            self.setbtnpayment.setTitle("โปรดระบุ", for: .normal)
            self.numBath.text = "0"
            self.setbtndate.setTitle(today, for: .normal)
            self.lbFunds.text = "กองทุนในตระกร้า (0)"
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
            self.viewbtn.backgroundColor = .gray
            self.tableView.reloadData()
        } else if self.delete == "1"{
            let alert = UIAlertController(title: "", message: "โปรดเลือกกองทุน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
          
        }else if self.date != today{
            self.tableView.reloadData()
            let alert = UIAlertController(title: "", message: "ชำระเงินเสร็จสมบรูณ์", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("money",self.money ?? "")
            sendclick(moneyupdate: self.money ?? "")
            self.piceFunds = ""
            self.date = ""
            self.risk = ""
            self.enName = ""
            self.thName = ""
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
            self.setbtnpayment.setTitle("โปรดระบุ", for: .normal)
            self.numBath.text = "0"
            self.setbtndate.setTitle(today, for: .normal)
            self.lbFunds.text = "กองทุนในตระกร้า (0)"
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
            self.viewbtn.backgroundColor = .gray
            self.tableView.reloadData()
            
        } else if self.date == today{
            let alert = UIAlertController(title: "", message: "ชำระเงินเสร็จสมบรูณ์", preferredStyle: UIAlertController.Style.alert)
                       alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
                       print(money - piceFunds)
                       let moneyupdate = String(money - piceFunds)
                       sendclick(moneyupdate: moneyupdate)
                       self.piceFunds = ""
                       self.date = ""
                       self.payment = "โปรดระบุ"
                       self.risk = ""
                       self.enName = ""
                       self.thName = ""
                       self.setbtnChooseFunds.setTitle("", for: .normal)
                       self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
                       self.setbtnDeleteFunds.setTitle("", for: .normal)
                       self.setbtnpayment.setTitle("โปรดระบุ", for: .normal)
                       self.numBath.text = "0"
                       self.lbFunds.text = "กองทุนในตระกร้า (0)"
                       self.setbtnChooseFunds.setTitle("", for: .normal)
                       self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
                       self.setbtnDeleteFunds.setTitle("", for: .normal)
                       self.viewbtn.backgroundColor = .gray
                       self.tableView.reloadData()
            
        }
        
}
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lbFunds: UILabel!
    @IBOutlet weak var setViewCalendar: UIView!
    @IBOutlet weak var setbtnpayment: UIButton!
    @IBOutlet weak var setbtndate: UIButton!
    @IBOutlet weak var numBath: UILabel!
    @IBOutlet weak var viewbtn: UIView!
    // MARK:  Var 
    fileprivate weak var calendar: FSCalendar!
    var delete: String = ""
    var piceFunds: String = ""
    var enName: String = ""
    var thName: String = ""
    var risk: String = ""
    var date: String = ""
    var payment: String = ""
    var selectedDates = [String]()
    var money: String?
    var interactor: BuyBusinessLogic?
   var router: (NSObjectProtocol & BuyRoutingLogic & BuyDataPassing)?
  
  // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = BuyInteractor()
    let presenter = BuyPresenter()
    let router = BuyRouter()
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
  
  // MARK: viewDidLoad
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doMoney()
    setNotificationCenterSearch()
    setNotificationCenterPayment()
    self.viewbtn.clipsToBounds = true
    self.viewbtn.layer.cornerRadius = 15
    self.viewbtn.layer.shadowColor = UIColor.systemGray.cgColor
    self.viewbtn.layer.shadowOpacity = 0.5
    self.viewbtn.layer.shadowRadius = 10
    self.viewbtn.layer.masksToBounds = false
    let dataFormatter = DateFormatter()
    dataFormatter.dateFormat = "dd/MM/yyyy"
    let formattedDate = dataFormatter.string(from: Date())
    if self.date == "" {
        self.setbtndate.setTitle(formattedDate, for: .normal)
        self.setbtnpayment.setTitle("โปรดระบุ", for: .normal)
        }
    }
    // MARK: interactor
    func doMoney() {
      let request = Buy.FetchMoneyData.Request()
      interactor?.doMoney(request: request)
        }
    // MARK: viewModel
    func displaymoneyfunds(viewModel: Buy.FetchMoneyData.ViewModel){
        let viewModel = viewModel.money ?? ""
        self.money = viewModel
        print("MoneyBuy",   self.money ?? "")
        }
    // MARK: NotificationCenterSearch
    func setNotificationCenterSearch() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivedsearchNotificationCenter), name: NSNotification.Name(NotificationCenterSearch.Clicked.rawValue), object: nil)
        }
    @objc func receivedsearchNotificationCenter(notifition: Notification) {
        print("Did received")
        if let data = notifition.userInfo as NSDictionary? {
//            print("piceFundsBuy>>", data["picefunds"] ?? "")
//            print("enNameBuy>>", data["enName"] ?? "")
//            print("thNameBuy>>", data["thName"] ?? "")
//            print("riskBuy>>", data["risk"] ?? "")
            piceFunds = data["picefunds"]  as? String ?? ""
            enName = data["enName"]  as? String ?? ""
            thName = data["thName"]  as? String ?? ""
            risk = data["risk"]  as? String ?? ""
            date = data["date"]  as? String ?? ""
            payment  = data["payment"]  as? String ?? ""
            if piceFunds == "" {
                self.numBath.text = self.piceFunds
                self.viewbtn.backgroundColor = .gray
                self.setbtnChooseFunds.setTitle("", for: .normal)
                self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
                self.setbtnDeleteFunds.setTitle("", for: .normal)
            } else {
            
                self.setbtnChooseFunds.setTitle("เลือกกองทุน    ", for: .normal)
                self.setbtnChooseFunds.setImage( UIImage(named: "plus"), for: .normal)
                self.setbtnDeleteFunds.setTitle("ลบกองทุน", for: .normal)
                self.setbtndate.setTitle(date, for: .normal)
                self.setbtnpayment.setTitle(payment, for: .normal)
                self.numBath.text = self.piceFunds
                self.lbFunds.text = "กองทุนในตระกร้า (1)"
                self.delete = "0"
                self.viewbtn.backgroundColor = .systemBlue
        
                self.tableView.reloadData()
            }
//            print("piceFundsBuy", piceFunds)
    
        }
    }
    // MARK: NotificationCenterPayment
    func setNotificationCenterPayment() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivedPaymentNotificationCenter), name: NSNotification.Name(NotificationCenterPayment.Clicked.rawValue), object: nil)
    }
    @objc func receivedPaymentNotificationCenter(notifition: Notification) {
        print("Did received")
        if let data = notifition.userInfo as NSDictionary? {
//            print("paymentnameBuy>>",data["payment"] ?? "")
            let payment = data["payment"] as? String
            let pice = data["picefunds"] as? String
            enName = data["enName"]  as? String ?? ""
            thName = data["thName"]  as? String ?? ""
            risk = data["risk"]  as? String ?? ""
            date = data["date"]  as? String ?? ""
            self.piceFunds = pice ?? ""
            print("piceFundsBuy",  self.piceFunds)
            if payment == "" {
        
            } else {
                self.setbtnpayment.setTitle(payment, for: .normal)
                self.setbtnChooseFunds.setTitle("เลือกกองทุน    ", for: .normal)
                self.setbtnChooseFunds.setImage( UIImage(named: "plus"), for: .normal)
                self.setbtnDeleteFunds.setTitle("ลบกองทุน", for: .normal)
                self.setbtndate.setTitle(date, for: .normal)
                self.setbtnpayment.setTitle(payment, for: .normal)
                self.tableView.reloadData()
               
            }
        }
    }
    // MARK: func NotificationCenter to Trade
    func sendclick(moneyupdate: String) {
        var data = [String: String]()
        data["moneyupdate"] = moneyupdate
        data["payment"] = self.payment
        data["picefunds"] = self.piceFunds
        data["enName"] = self.enName
        data["thName"] = self.thName
        data["risk"] = self.risk
        data["date"] = self.date
        NotificationCenter.default.post(name: NSNotification.Name(NotificationCenterTrade.Clicked.rawValue), object: nil, userInfo: data)
    }
    // MARK: func Check Weekend
    func CheckSatSunday(today:Date) ->Bool{
        var DayExist:Bool
        // let today = NSDate()
        let calendar =  NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        let components = calendar!.components([.weekday], from: today)
            if components.weekday == 1 {
                print("Sunday")
                let alert = UIAlertController(title: "ขออภัย", message: "วันเสาร์ - วันอาทิตย์ ปิดให้บริการ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                DayExist = false
                
            } else if components.weekday == 7{
                print("Saturday")
                let alert = UIAlertController(title: "ขออภัย", message: "วันเสาร์ - วันอาทิตย์ ปิดให้บริการ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ปิด", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                DayExist = false
            } else{
                print("It's not Saturday and  Sunday ")
                DayExist = true
            }
        self.selectedDates = ["\(String(describing: components.weekday))"]
        print("weekday :\(String(describing: components.weekday)) ")
        return DayExist
        }
}
// MARK: Extention TableView
extension BuyViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.piceFunds == "" {
            return 1
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyViewCell") as! BuyViewCell
        cell.index = indexPath
        cell.didtap = self
        cell.piceFundsBuy = self.piceFunds
        cell.enNameBuy = self.enName
        cell.thNameBuy = self.thName
        cell.riskBuy = self.risk
        cell.date = self.date
        cell.delete = self.delete
 
//        print("item >>", indexPath.item)
        return cell
       
    }
}
// MARK: Extention TableView DidtapSecondCalendar
extension BuyViewController: DidtapSecondCalendar {
    func onClickSecondCalendar(index: Int) {
        print("\(index) index")
        if index == 0 {
            router?.goToSearchFundsPreview(mainpage: "Buy")
        }
    }
}
// MARK: ExtentionFSCalendar
extension BuyViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        let formattedDate = dataFormatter.string(from: date)
        print(formattedDate)
        
        self.date = formattedDate
        self.setbtndate.setTitle( self.date , for: .normal)
        if self.date == formattedDate {
            self.setViewCalendar.backgroundColor = .clear
            self.setViewCalendarSecond.backgroundColor = .clear
            self.setbtnCloseCalendar.setImage( UIImage(named: ""), for: .normal)
            calendar.removeFromSuperview()
        
        }else {
            self.setbtnChooseFunds.setTitle("", for: .normal)
            self.setbtnChooseFunds.setImage( UIImage(named: ""), for: .normal)
            self.setbtnDeleteFunds.setTitle("", for: .normal)
        }
        
//        router?.goToback(dateData: T##String?)
    }
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {

           return CheckSatSunday(today: date)
       }
}
//extension Date {
//  var isWeekend: Bool {
//    return NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.isDateInWeekend(self)
//  }
//}