//
//  ProgressView.swift
//  ProgressView
//
//  Created by Emil Abduselimov on 02.10.2020.
//

import UIKit

class ProgressView: UIView {

    var progress: CGFloat = 0 {
        didSet {
            progress = min(1, max(0, progress))
            setNeedsLayout()
        }
    }

    var progressColor: UIColor = .coolBlue {
        didSet {
            progressLayer.fillColor = progressColor.cgColor
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 8)
    }

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override var layer: CAShapeLayer {
        return (super.layer as? CAShapeLayer) ?? CAShapeLayer()
    }

    private let progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.coolBlue.cgColor
        layer.strokeColor = UIColor.clear.cgColor
        return layer
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }

    // MARK: - Configuration

    private func configure() {
        layer.strokeColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.silver.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        progressLayer.contentsScale = contentScaleFactor
        layer.addSublayer(progressLayer)
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.path = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height / 2).cgPath
        progressLayer.path = UIBezierPath(roundedRect: CGRect(origin: bounds.origin,
                                                              size: CGSize(width: round(bounds.width * progress),
                                                                           height: bounds.height)),
                                          cornerRadius: bounds.height / 2).cgPath
    }

}

