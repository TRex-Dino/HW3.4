//
//  SliderUIkit.swift
//  HW3.4
//
//  Created by Dmitry on 11.06.2021.
//

import SwiftUI

struct SliderUIkit: UIViewRepresentable {
    @Binding var value: Double
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 1,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(alpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension SliderUIkit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUIkit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIkit(value: .constant(50), alpha: 0.1)
    }
}
