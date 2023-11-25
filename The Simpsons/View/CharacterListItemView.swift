//
//  CharacterListView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct CharacterListItemView: View {
    
    // Karakterlerimizi HomePageView da liste icerisine yerlestirdigimizdeki her bir liste hucresinin tasarimini bosluklarindan tutun yazi tipine kadar burada tasarliyoruz ve Ta Da karsinizda yeniden kullanilabilir listRow lar.
    
    // simpsons degerini olusturuyor ve SimpsonsJsonModeli yapisinda oldugunu tanimliyoruz. Tabikide View yuklenmeden once yapiyi tanimlasakta bir deger atamasi yapmamiz gerekiyor bu yuzden en asagida #Preview da kullanilmak uzere preview() fonksiyonumuzu olusturduk
    let simpsons: SimpsonsJsonModel
    
    var body: some View {
        
        
        ///-----START HSTACK
        HStack(alignment: .center, spacing: 16, content: {
            Image(simpsons.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(8)
            VStack(alignment: .leading, spacing: 8) {
                Text(simpsons.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Text(simpsons.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
            

        }) ///-----END HSTACK
        
    }
    
    //MARK: - FUNC FOR PREVIEW VIEW
    // 1) Bu fonksiyon oncelikle kendi icerisinde tamda ihtiyacimiz olan SimpsonsJsonModel yapisinda degerler iceren bir array olan simpson degerini "simpsins.json" formatindaki dosyayi decode ederek olusturuyor.
    // 2) Ardindan tamda #Preview bolumumuzun istedigi gibi CharacterListItemView sayfasini geri donduruyor ustelik yukarida sadece yapisini belirledigimiz simpsons degerine gerekli deger atamasini yapiyor.
    static func preview() -> some View {
            let simpsons: [SimpsonsJsonModel] = Bundle.main.decode("simpsons.json")
            return CharacterListItemView(simpsons: simpsons[5])
        }
    
    
}

#Preview(traits: .sizeThatFitsLayout) {
    CharacterListItemView.preview()
        
}
