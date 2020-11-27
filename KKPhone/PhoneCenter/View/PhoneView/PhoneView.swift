//
//  PhoneView.swift
//  KKdayPortal
//
//  Created by KKday on 2020/11/24.
//  Copyright © 2020 WEI-TSUNG CHENG. All rights reserved.
//

import UIKit

final class PhoneView: UIView {
    
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
    
    let callNumberView: PhoneCallView = PhoneCallView(image: UIImage(systemName: "phone.circle.fill")!)
    let backNumberView: PhoneBackView = PhoneBackView(image: UIImage(systemName: "xmark.rectangle.fill")!) 
    
    var sendNumberHandler: (String?) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        bindHandler()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
        bindHandler()
    }
    
    private func setup() {

        self.addSubview(numberTextField)
        self.addSubview(numStackView)
        self.addSubview(callNumberView)
        self.addSubview(backNumberView)
        
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        numberTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        numberTextField.textAlignment = .center
        numberTextField.isEnabled = false
        numberTextField.adjustsFontSizeToFitWidth = true
        numberTextField.attributedPlaceholder = NSAttributedString(string:
                                                                    "Please Enter Phone Number", attributes:
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
        
        callNumberView.snp.makeConstraints { maker in
            maker.centerX.equalTo(numStackView)
            maker.top.equalTo(numStackView.snp.bottom).offset(20)
        }
        
        backNumberView.snp.makeConstraints { maker in
            maker.centerY.equalTo(callNumberView)
            maker.leading.equalTo(callNumberView.snp.trailing).offset(30)
        }
        
    }
    
    private func bindHandler() {
        
        oneView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "1"
        }
        twoView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "2"
        }
        threeView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "3"
        }
        fourView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "4"
        }
        fiveView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "5"
        }
        sixView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "6"
        }
        sevenView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "7"
        }
        eightView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "8"
        }
        nineView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "9"
        }
        asteriskView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "*"
        }
        zeroView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "0"
        }
        poundSignView.addNumHandler = { [weak self] in
            self?.numberTextField.text! += "#"
        }
        
        callNumberView.callNumHandler = { [weak self] in
            self?.sendNumberHandler(self?.numberTextField.text)
        }
        
        backNumberView.backNumHandler = { [weak self] in
            guard let text = self?.numberTextField.text, !text.isEmpty else {
                return
            }
            self?.numberTextField.text?.removeLast()
        }
        
    }

    
    
}
