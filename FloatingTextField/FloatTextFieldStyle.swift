//
//  FloatTextFieldStyle.swift
//  Expands
//
//  Created by Sunil on 17/1/22.
//

import SwiftUI

struct FloatTextFieldStyle: TextFieldStyle {
    enum FloatType: String {
        case border
        case float
    }
    
    let placeholder: String
    let placeholderColor: Color
    let placeholderBackgroundColor: Color
    let type: FloatType

    var isEditing: Bool = false

    func _body(configuration: TextField<_Label>) -> some View {
        
        
        if type == .border {
            ZStack(alignment: .leading) {
                Text(self.placeholder)
                    .font(.system(self.isEditing ? .title2: .title3, design: .rounded))
                    .foregroundColor(self.placeholderColor.opacity(0.5))
                    .padding(.horizontal, self.isEditing ? 0 : 8)
                    .background(self.placeholderBackgroundColor)
                    .offset(y: self.isEditing ? 0: -28)
                    .scaleEffect(self.isEditing ? 1: 0.9, anchor: .leading)
                
                configuration
                    .font(.system( .title2, design: .rounded))
                    .foregroundColor(self.placeholderColor)

            }
            .animation(.easeOut)
            .padding(.horizontal)
            .padding(.vertical, 10 )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(self.isEditing ? self.placeholderColor.opacity(0.5) : self.placeholderColor, lineWidth: 2)
            )
        } else {
            ZStack(alignment: .leading) {
                Text(self.placeholder)
                    .foregroundColor(.gray.opacity(0.5))
                    .offset(y: self.isEditing ? 0: -25)
                    .scaleEffect(self.isEditing ? 1: 0.9, anchor: .leading)
                    .font(.system(self.isEditing ? .title2: .title3, design: .rounded))
                
                configuration
                    .foregroundColor(self.placeholderColor)

            }
            .padding(.top, self.isEditing ? 0: 18)
            .animation(.default)
            .padding()
            .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(self.isEditing ? Color.gray.opacity(0.5) : Color.gray, lineWidth: 2)
            )
            .cornerRadius(10)
        }
        

        
    }
}
