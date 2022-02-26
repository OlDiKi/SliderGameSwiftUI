//
//  SliderView.swift
//  SliderGameSwiftUI
//
//  Created by Дмитрий Олейнер on 26.02.2022.
//

import Foundation
import UIKit

class SliderViewcontroller: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSlider()
    }
    
    @IBAction func slider(_ sender: UISlider) {
    }
    
    private func setSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
    }
}
