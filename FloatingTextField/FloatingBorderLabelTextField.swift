//
//  FloatingBorderLabelTextField.swift
//  Expands
//
//  Created by Sunil on 17/1/22.
//

import SwiftUI

struct FloatingBorderLabelTextField: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .leading) {
            Text(self.placeholder)
                .font(.system(self.text.isEmpty ? .title2: .title3, design: .rounded))
                .foregroundColor(.gray.opacity(0.5))
                .padding(.horizontal, self.text.isEmpty ? 0 : 8)
                .background(Color.white)
                .offset(y: self.text.isEmpty ? 0: -28)
                .scaleEffect(self.text.isEmpty ? 1: 0.9, anchor: .leading)
            
            TextField("", text: self.$text)
                .font(.system( .title2, design: .rounded))
                .foregroundColor(.black)


        }
        .animation(.easeOut)
        .padding(.horizontal)
        .padding(.vertical, 10 )
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(self.text.isEmpty ? Color.gray.opacity(0.5) : Color.gray, lineWidth: 2)
        )
    }
}

struct FloatingBorderLabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FloatingBorderLabelTextField(placeholder: "First name", text: .constant("teasd"))
            FloatingBorderLabelTextField(placeholder: "Last name", text: .constant("Testing"))
        }
        .previewLayout(.sizeThatFits)
        .padding()
        
    }
}
