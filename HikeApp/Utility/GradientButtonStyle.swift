//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by Iuliia Volkova on 21.05.2024.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement
                configuration.isPressed ?
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            .cornerRadius(40)
    }
}
