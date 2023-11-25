//
//  CoverImageView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct CoverImageView: View {
    
    // Beyaz zemin uzerinde TabView Indicatorlarimiz Beyaz kalamazdi cok kotu bir UI/UX deneyimi olacagindan onlari siyaha cevirmek icin init() metodunu kullandik.
    init() {
              UIPageControl.appearance().currentPageIndicatorTintColor = .black
              UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.4)
           }
    
    var characters: [CardCharacterModel] = cardCharacterData
    
    
    var body: some View {
        
        
        TabView{
   
            ForEach(characters[0...4]) { item in
                ZStack {
                    // Belki ilerde yeni karakterler icinde sayfalar ekleriz diyerek optinal degerimizimizi daha guvenli bir yontemle bind edip bir bulut objesi yerlestirmeyi daha uygun buldum. Hata alip kapanmaktan iyidir. Nede olsa Sipringfield Evreninde de Pofuduk bulutler bolca var :)
                    FallingObjectView(fallingObject: item.fallingObject ?? "☁️")
                    Image("\(item.character)-cover")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                }
            }
            .padding()
            
    
        }
        .tabViewStyle(.page)
        .frame(width: 400, height: 300)
    
        
        
    }
    
    
    
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
