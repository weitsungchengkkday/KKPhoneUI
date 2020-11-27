//
//  PhoneCallingView.swift
//  KKPhone
//
//  Created by KKday on 2020/11/25.
//

import UIKit

final class PhoneCallingView: UIView {
    
    var numberTextField: UITextField = UITextField()
    
    private let oneView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "1.circle.fill")!)
    let twoView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "2.circle.fill")!)
    let threeView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "3.circle.fill")!)
    let numStackViewOne: UIStackView = UIStackView()
    
    let fourView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "4.circle.fill")!)
    let fiveView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "5.circle.fill")!)
    let sixView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "6.circle.fill")!)
    let numStackViewTwo: UIStackView = UIStackView()
    
    let sevenView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "7.circle.fill")!)
    let eightView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "8.circle.fill")!)
    let nineView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "9.circle.fill")!)
    let numStackViewThree: UIStackView = UIStackView()
    
    let asteriskView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "staroflife.circle.fill")!)
    let zeroView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "0.circle.fill")!)
    let poundSignView: PhoneNumberView = PhoneNumberView(image: UIImage(systemName: "number.circle.fill")!)
    let numStackViewFour: UIStackView = UIStackView()
    
    let numStackView: UIStackView = UIStackView()
    
    let endCallNumberView: PhoneEndCallView = PhoneEndCallView(image: UIImage(systemName: "phone.down.circle.fill")!)
    

    var sendEndNumberlHandler: () -> Void = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        bindHandler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {

        self.addSubview(numberTextField)
        self.addSubview(numStackView)
        self.addSubview(endCallNumberView)
        
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        numberTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        numberTextField.textAlignment = .center
        numberTextField.isEnabled = false
        numberTextField.adjustsFontSizeToFitWidth = true
        numberTextField.attributedPlaceholder = NSAttributedString(string:
                                                                    "Current Number", attributes:
                                                                        [NSAttributedString.Key.foregroundColor:UIColor.gray])
        numberTextField.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        // symbol 1, 2, 3
        numStackViewOne.addArrangedSubview(oneView)
        numStackViewOne.addArrangedSubview(twoView)
        numStackViewOne.addArrangedSubview(threeView)
        numStackViewOne.alignment = .fill
        numStackViewOne.distribution = .fill
        numStackViewOne.spacing = 20
        numStackViewOne.axis = .horizontal
        
        // symbol 4, 5, 6
        numStackViewTwo.addArrangedSubview(fourView)
        numStackViewTwo.addArrangedSubview(fiveView)
        numStackViewTwo.addArrangedSubview(sixView)
        numStackViewTwo.alignment = .fill
        numStackViewTwo.distribution = .fill
        numStackViewTwo.spacing = 20
        numStackViewTwo.axis = .horizontal
        
        // symbol 7, 8, 9
        numStackViewThree.addArrangedSubview(sevenView)
        numStackViewThree.addArrangedSubview(eightView)
        numStackViewThree.addArrangedSubview(nineView)
        numStackViewThree.alignment = .fill
        numStackViewThree.distribution = .fill
        numStackViewThree.spacing = 20
        numStackViewThree.axis = .horizontal
        
        // symbol *, 0, #
        numStackViewFour.addArrangedSubview(asteriskView)
        numStackViewFour.addArrangedSubview(zeroView)
        numStackViewFour.addArrangedSubview(poundSignView)
        numStackViewFour.alignment = .fill
        numStackViewFour.distribution = .fill
        numStackViewFour.spacing = 20
        numStackViewFour.axis = .horizontal
        
        // total symbols
        numStackView.addArrangedSubview(numStackViewOne)
        numStackView.addArrangedSubview(numStackViewTwo)
        numStackView.addArrangedSubview(numStackViewThree)
        numStackView.addArrangedSubview(numStackViewFour)
        numStackView.alignment = .fill
        numStackView.distribution = .fill
        numStackView.spacing = 20
        numStackView.axis = .vertical
        
        numberTextField.snp.makeConstraints { maker in
            maker.centerX.equalTo(numStackViewOne)
          
            maker.bottom.equalTo(numStackViewOne).offset(-120)
            maker.width.equalTo(numStackView)
        }
        
        numStackView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(124)
        }
        
        endCallNumberView.snp.makeConstraints { maker in
            maker.centerX.equalTo(numStackView)
            maker.top.equalTo(numStackView.snp.bottom).offset(20)
        }
        
        
    }
    
    private func bindHandler() {
        
        oneView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "1")
        }
        twoView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "2")
        }
        threeView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "3")
        }
        fourView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "4")
        }
        fiveView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "5")
        }
        sixView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "6")
        }
        sevenView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "7")
        }
        eightView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "8")
        }
        nineView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "9")
        }
        asteriskView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "＊")
        }
        zeroView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "0")
        }
        poundSignView.addNumHandler = { [weak self] in
            self?.nextCallingAciton(num: "＃")
        }
        
        endCallNumberView.endCallNumHandler = { [weak self] in
            self?.sendEndNumberlHandler()
        }
        
    }
    
    func nextCallingAciton(num: String) {
        print(num)
    }
}


