//
//  FloatingLabelTextField.swift
//  Expands
//
//  Created by Sunil on 17/1/22.
//

import SwiftUI

struct FloatingLabelTextField: View {
    let placeholder: String
    @Binding var text: String

    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(self.placeholder)
                .foregroundColor(.gray.opacity(0.5))
                .offset(y: self.text.isEmpty ? 0: -25)
                .scaleEffect(self.text.isEmpty ? 1: 0.9, anchor: .leading)
                .font(.system(self.text.isEmpty ? .title2: .title3, design: .rounded))
            
            TextField("", text: self.$text)
                .foregroundColor(.black)
        }
        .padding(.top, self.text.isEmpty ? 0: 18)
        .animation(.default)
        .padding()
        .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(self.text.isEmpty ? Color.gray.opacity(0.5) : Color.gray, lineWidth: 2)
        )
        .cornerRadius(10)
    }
}

struct FloatingLabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FloatingLabelTextField(placeholder: "First name", text: .constant(""))
            FloatingLabelTextField(placeholder: "Last name", text: .constant("Testing"))
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
