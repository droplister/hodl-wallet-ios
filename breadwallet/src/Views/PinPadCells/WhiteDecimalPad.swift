//
//  WhiteDecimalPad.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2017-03-16.
//  Copyright © 2017 breadwallet LLC. All rights reserved.
//

import UIKit

class WhiteDecimalPad : GenericPinPadCell {

    override func setAppearance() {
        if isHighlighted {
            centerLabel.backgroundColor = .secondaryGrayText
            centerLabel.textColor = .darkText
        } else {
            centerLabel.backgroundColor = .grayBackground
            centerLabel.textColor = .whiteTint
        }
    }

    override func addConstraints() {
        centerLabel.constrain(toSuperviewEdges: nil)
        imageView.constrain(toSuperviewEdges: nil)
    }
}
