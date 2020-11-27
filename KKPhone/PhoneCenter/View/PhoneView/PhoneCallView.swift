//
//  PhoneCallView.swift
//  KKPhone
//
//  Created by KKday on 2020/11/25.
//

import UIKit

final class PhoneCallView: UIView {
    
    private let callNumBtn = UIButton()
    private let imageView = UIImageView()
    private var image: UIImage
    let whiteView = UIView()
    
    var callNumHandler: () -> Void = {}
    
    required init(image: UIImage) {
        self.image = image
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        whiteView.layer.cornerRadius = 38
        whiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.tintColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        imageView.image = image
        self.addSubview(whiteView)
        self.addSubview(imageView)
        self.addSubview(callNumBtn)
        
        self.snp.makeConstraints { maker in
            maker.height.width.equalTo(90)
        }
        
        self.whiteView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.height.width.equalTo(76)
        }
        
        self.imageView.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.callNumBtn.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalToSuperview()
        }
        
        self.callNumBtn.addTarget(self, action: #selector(callNumber), for: .touchUpInside)
    }
    
    @objc func callNumber() {
        callNumHandler()
    }

}
