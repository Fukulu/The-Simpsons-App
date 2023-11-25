//
//  FallingObjectSetupView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct FallingObjectView: View {
    
    // Farkli objelerlede kullanilabilmesi adina fallingObject adinda bir degisken tanimladik
    var fallingObject: String
    
    var body: some View {
        // Burada dikkat ederseniz X ekseninde soldan saga dogru duzenli mesafeler birakilarak FallingObjectSetupView da olusturdugumuz oruntuyu tekrar ve tekrar cagirarak yanyana yerlestiriyoruz
        // NOT: Belki daha farkli yontemler kullanilarak bu akis goruntusu saglanabilirdi fakat bu akisi tamamiyle kendi basima kafa patlatarak deneme ve yanilma yoluyla olusturdugum icin bulabildigim tekrar kullanilabilir en iyi yontem bu oldu acikcasi. Isi ilerletip daha guzel cozumleriniz varsa iletisime gecerseniz severek bakabilirim.
        HStack{
            FallingObjectSetupView(offsetY: -50, offsetX: -30, fallingObject: fallingObject)
            FallingObjectSetupView(offsetY: -50, offsetX: 30, fallingObject: fallingObject)
            FallingObjectSetupView(offsetY: -50, offsetX: 90, fallingObject: fallingObject)
        }
        
    }
    
    
    
}

#Preview {
    FallingObjectView(fallingObject: "🍩")
}
