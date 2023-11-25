//
//  LaunchScreenView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isAnimating: Bool = false
    var dynamicWidth = UIScreen.main.bounds.width / 5
    
    var body: some View {
        
        // Burada assets icerisinde belirledigimiz donut resminin buyuklugunu ayarliyor arkaplan rengini belirliyoruz ve ardindan kendi ekseni etrafinda donmesini sagliyoruz.
        ZStack {
            Color.accent.ignoresSafeArea()
            ZStack {
                Image("donut")
                    .resizable()
                    .scaledToFit()
                    .frame(width: dynamicWidth)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 10, x: 2, y: -2)
                    .rotationEffect(isAnimating ? .radians(360) : .radians(0))
                    .onAppear(perform: {
                            withAnimation(Animation.linear(duration: 10)
                                .speed(0.05)
                                .repeatForever(autoreverses: false)) {
                            isAnimating = true
                        }
                    })

                
            }
        }
        
        
    }
    
    
    
}

#Preview {
    LaunchScreenView()
}
