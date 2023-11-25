//
//  ContentView.swift
//  The Simpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var closeLaunchView: Bool = false
    
    var body: some View {
        
        
        VStack {
            if closeLaunchView {
                OnboardingView()
            } else {
                LaunchScreenView()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                        closeLaunchView = true
                    }
                }
        
        
    }
    
    
    
}

#Preview {
    ContentView()
}
