//
//  Buttons.swift
//  SliderGameSwiftUI
//
//  Created by Дмитрий Олейнер on 27.02.2022.
//

import SwiftUI

struct Buttons: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(title: "Check") {
        }
    }
}
