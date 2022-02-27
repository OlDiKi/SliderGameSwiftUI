//
//  SliderValue.swift
//  SliderGameSwiftUI
//
//  Created by Дмитрий Олейнер on 27.02.2022.
//

import SwiftUI

struct SliderValue: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
       
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeValueSlider(_:)),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(.red)
            .withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
   
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func didChangeValueSlider(_ sender: UISlider) {
            currentValue = Double(sender.value )
        }
    }
}

struct SliderValue_Previews: PreviewProvider {
    static var previews: some View {
        SliderValue(currentValue: .constant(70), opacity: 30)
    }
}
