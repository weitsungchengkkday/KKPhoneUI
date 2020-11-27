//
//  PhoneViewController.swift
//  KKdayPortal
//
//  Created by KKday on 2020/11/24.
//  Copyright © 2020 WEI-TSUNG CHENG. All rights reserved.
//

import UIKit
import SnapKit

final class PhoneViewController: UIViewController {
    
    let phoneView = PhoneView()
    var phoneCallingView = PhoneCallingView()
    let viewModel = PhoneViewModel()
    let dismissBtn = UIButton()
    let hiddenBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        bindViewHandler()
        bindViewModel()
        addAction()
        
    }
    
    private func setupUI() {
        
        dismissBtn.setBackgroundImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        dismissBtn.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        hiddenBtn.setBackgroundImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        hiddenBtn.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        phoneCallingView.isHidden = true
        
        self.view.addSubview(phoneView)
        self.view.addSubview(phoneCallingView)
        self.view.addSubview(dismissBtn)
        self.view.addSubview(hiddenBtn)
        
        dismissBtn.snp.makeConstraints { maker in
            maker.top.equalTo(self.phoneView.snp.top).offset(10)
            maker.trailing.equalTo(self.phoneView.snp.trailing).offset(-10)
            maker.size.equalTo(45)
        }
        
        hiddenBtn.snp.makeConstraints { maker in
            maker.top.equalTo(self.phoneView.snp.top).offset(10)
            maker.leading.equalTo(self.phoneView.snp.leading).offset(10)
            maker.size.equalTo(45)
        }
        
        phoneView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(50)
            maker.trailing.leading.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        phoneCallingView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(50)
            maker.trailing.leading.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
    }
    
    private func bindViewHandler() {
        
        phoneView.sendNumberHandler = { [weak self] num in
            print("Call: \(String(describing: num))")
            print(self)
            self?.viewModel.currentPhoneNum = num ?? ""
            self?.viewModel.changeStatus(status: .calling)
        }
        
        phoneCallingView.sendEndNumberlHandler = { [weak self] in
            print("Close")
            self?.viewModel.changeStatus(status: .normal)
        }
    }
    
    private func bindViewModel() {
        
        viewModel.changePhoneViewHandler = { [weak self] in
            
            guard let status = self?.viewModel.status else {
                return
            }
            
            switch status {
            case .normal:
                self?.phoneView.isHidden = false
                self?.phoneView.numberTextField.text = ""
                
                self?.phoneCallingView.isHidden = true
                
            case .calling:
                self?.phoneView.isHidden = true
                
                self?.phoneCallingView.isHidden = false
                self?.phoneCallingView.numberTextField.text = self?.viewModel.currentPhoneNum ?? ""
            }
            
            
        }
    }
    
    private func addAction() {
        dismissBtn.addTarget(self, action: #selector(leave), for: .touchUpInside)
        hiddenBtn.addTarget(self, action: #selector(hide), for: .touchUpInside)
    }
    
    @objc func leave() {
        viewModel.closePhoneView()
    }
    
    @objc func hide() {
        viewModel.hidePhoneView()
    }
    
}
