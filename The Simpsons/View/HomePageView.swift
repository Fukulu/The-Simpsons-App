//
//  HomePageView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct HomePageView: View {
    
    
    
    var body: some View {
        
        // Burada en onemli nokta simpsons degerimizi olusturuyoruz ve bu degerin SimpsonsJsonModel yapisinda datalardan olusan bir Array oldugunu belirtiyoruz. Gerekli veriyi cekebilmesi icin Bundle Extension da olusturdugumuz decode fonksiyonunu cagiriyor ve icerisine json formatinda yazmis oldugumuz "simpsons.json" i yerlestiriyoruz. Isin kalan kismini decode fonksiyonumuz gerceklestiriyor ve butun datalarimizin aktarimi sagliyoruz.
        let simpsons: [SimpsonsJsonModel] = Bundle.main.decode("simpsons.json")
        
        NavigationStack{
            
            List {
                CoverImageView()
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding(10)
                
                ForEach(simpsons){ simpson in
                    NavigationLink(destination: CharacterDetailView(simpsons: simpson)) {
                        CharacterListItemView(simpsons: simpson)
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                .listRowSeparator(.hidden)
                
            }
            // List style ile sayfanin yapisini kenar boslugunu belirliyorsun
            .listStyle(.plain)
            .navigationTitle("The Simpsons")
            .navigationBarTitleDisplayMode(.large)
                
            
        }
        
        
        
        
    }
    
    
    
}

#Preview {
    HomePageView()
}
