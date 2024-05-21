//
//  CardView.swift
//  HikeApp
//
//  Created by Iuliia Volkova on 17.05.2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIRES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    // MARK: - FUNCTIONS
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber

        imageNumber = randomNumber
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was tapped")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAINCONTENT
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .customIndigoMedium,
                                    .customSalmonLight
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                Button {
                    // ACTION: Generate a random number
                    print("A button was pressed")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25),  radius: 0.35, x: 1, y: 2)
                        
                }
                .buttonStyle(GradientButton())
                
            } //: VSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
