//
//  StartWipeWalletViewController.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2017-07-04.
//  Copyright © 2017 breadwallet LLC. All rights reserved.
//

import UIKit

class StartWipeWalletViewController : UIViewController {

    init(didTapNext: @escaping () -> Void) {
        self.didTapNext = didTapNext
        super.init(nibName: nil, bundle: nil)
    }

    private let didTapNext: () -> Void
    private let header = RadialGradientView(backgroundColor: .grayBackground, offset: 64.0)
    private let illustration = UIImageView(image: #imageLiteral(resourceName: "RestoreIllustration"))
    private let message = UILabel.wrapping(font: .customBody(size: 16.0), color: .gradientStart)
    private let warning = UILabel.wrapping(font: .customBody(size: 16.0), color: .whiteTint)
    private let button = ShadowButton(title: S.RecoverWallet.next, type: .primary)
    private let bullet = UIImageView(image: #imageLiteral(resourceName: "deletecircle"))

    override func viewDidLoad() {
        addSubviews()
        addConstraints()
        setInitialData()
    }

    private func addSubviews() {
        view.addSubview(header)
        header.addSubview(illustration)
        view.addSubview(message)
        view.addSubview(warning)
        view.addSubview(bullet)
        view.addSubview(button)
    }

    private func addConstraints() {
        header.constrainTopCorners(sidePadding: 0, topPadding: 0)
        header.constrain([
            header.constraint(.height, constant: 220.0) ])
        illustration.constrain([
            illustration.constraint(.width, constant: 64.0),
            illustration.constraint(.height, constant: 84.0),
            illustration.constraint(.centerX, toView: header, constant: 0.0),
            illustration.constraint(.centerY, toView: header, constant: C.padding[7]) ])
        message.constrain([
            message.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: C.padding[2]),
            message.topAnchor.constraint(equalTo: header.bottomAnchor, constant: C.padding[7]),
            message.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -C.padding[2]) ])
        bullet.constrain([
            bullet.leadingAnchor.constraint(equalTo: message.leadingAnchor),
            bullet.topAnchor.constraint(equalTo: message.bottomAnchor, constant: C.padding[4]),
            bullet.widthAnchor.constraint(equalToConstant: 16.0),
            bullet.heightAnchor.constraint(equalToConstant: 16.0) ])
        warning.constrain([
            warning.leadingAnchor.constraint(equalTo: bullet.trailingAnchor, constant: C.padding[2]),
            warning.topAnchor.constraint(equalTo: bullet.topAnchor, constant: 0.0),
            warning.trailingAnchor.constraint(equalTo: message.trailingAnchor) ])
        button.constrain([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.constraint(.height, constant:  65.0) ])
    }

    private func setInitialData() {
        view.backgroundColor = .grayBackground
        illustration.contentMode = .scaleAspectFill
        message.text = S.WipeWallet.startMessage
        warning.text = S.WipeWallet.startWarning
        button.tap = { [weak self] in
            self?.didTapNext()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
