//
//  ContentView.swift
//  FloatingTextField
//
//  Created by Sunil on 17/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        VStack(spacing: 8) {
            Group {
                FloatingLabelTextField(placeholder: "First name", text: self.$text)
                FloatingLabelTextField(placeholder: "Last name", text: self.$text)
            }

            Group {
                FloatingBorderLabelTextField(placeholder: "First name", text: self.$text)
                FloatingBorderLabelTextField(placeholder: "Lastq name", text: self.$text)
            }
            
            TextField("", text: self.$text)
                .textFieldStyle(FloatTextFieldStyle(placeholder: "First name", placeholderColor: .gray, placeholderBackgroundColor: .white, type: .border, isEditing: self.text.isEmpty))
            
            TextField("", text: self.$text)
                .textFieldStyle(FloatTextFieldStyle(placeholder: "First name", placeholderColor: .gray, placeholderBackgroundColor: .white, type: .float, isEditing: self.text.isEmpty))

        }
        .padding()
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
