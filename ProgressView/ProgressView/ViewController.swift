//
//  ViewController.swift
//  ProgressView
//
//  Created by Emil Abduselimov on 02.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var progressView: ProgressView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progress = 0.4
    }

    // MARK: - Action

    @IBAction private func onButtonTapped() {
        progressView.progress = 0.8
    }

}

