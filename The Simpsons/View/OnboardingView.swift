//
//  OnboardingView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct OnboardingView: View {
    
    var characters: [CardCharacterModel] = cardCharacterData
    
    var body: some View {
        
        // Aciklama gerektirecek cok bir sey yok sayilir sayfada tasarlamis oldugumuz CardView'u ForEach icerisinde gerekli bilgileri Lokal Datamizdan alarak hizlica olusturuyor ve TabView icerisine yerlestiriyoruz.
        
        ZStack {
            
            
            Color.accent.ignoresSafeArea()
            
            TabView{
                
                ForEach(characters) { item in
                    CardView(cardCharacterModel: item)
                }
                
            }
            .tabViewStyle(.page)
            .padding(.vertical, 20)
            
            
        }
        
        
        
    }
    
    
    
}

#Preview {
    OnboardingView()
}
