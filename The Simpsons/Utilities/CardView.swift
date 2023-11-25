//
//  CardView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct CardView: View {
    // isAnimating degiskeni kart etrafindaki parlama fonksiyonunu onApper ile baslatmak icin tanimlanmistir yani animasyonu kullanmak istiyorsaniz uncomment etmelisiniz
    
    //@State private var isAnimating: Bool = false
    
    // Ekran buyuklugune uygun boyutta kart goruntusu elde etmek icin dinamik genislik ve yukseklik degerleri
    var dynamicWidth = UIScreen.main.bounds.width
    var dynamicHeight = UIScreen.main.bounds.height
    
    // Lokal olusturdugumuz bu modeli cardCharacterModel degiskenine atiyoruz ve #Preview icerisinde cardCharacterData[0] i ekleyerek degerimizi onceden tanimliyoruz ki uyari almayalim.
    var cardCharacterModel: CardCharacterModel
    
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .frame(width: dynamicWidth * 0.85 + 10, height: dynamicHeight * 0.70 + 8)
                .foregroundStyle(
                    LinearGradient(colors: [Color(cardCharacterModel.darkColor), Color(cardCharacterModel.lightColor)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(.rect(cornerRadius: 20))
                
// MARK: - Round Line Effect - Uncomment to Use It
// Burada Ana Diktorgen yapisinin icerisine uzunlamasina bir diktorgen yerlestirip radians 360 derece vererek kendi ekseninde donmesini sagliyoruz. Ardindan .mask fonksiyonu ile dis cerceve ile ic cercevede ust uste bulunan iki ayri dikdortgenin arasinda bulunan dikdortgenimizin ondeki diktortgenin buyuklugunde bir maskeleme gerceklestiriyoruz ki iki dikdortgen yapida artik kose cizgide yol kateden parlama efekti gibi bir efekt elde edebiliyoruz. Bu efekti basta uygulamak istedim fakat daha sonra uygulamanin sadeligini gorsel olarak bozmamak adina kaldirdim. Dilerseniz daha sonra kullanabilmek adina ornek alarak inceleyebilirsiniz.
            
//            Rectangle()
//                .frame(width: dynamicWidth * 0.4, height: dynamicHeight * 0.70 + 80)
//                .foregroundStyle(Color(.white))
//                .clipShape(.rect(cornerRadius: 20))
//                .rotationEffect(isAnimating ? .radians(360) : .radians(0))
//                .onAppear(perform: {
//                    withAnimation(Animation
//                            .linear(duration: 10)
//                            .speed(0.05)
//                            .repeatForever(autoreverses: false)) {
//                        isAnimating = true
//                    }
//                })
//                .mask {
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(width: dynamicWidth * 0.85 + 10, height: dynamicHeight * 0.70 + 8)
//                    
//                }
            
            Rectangle()
                .frame(width: dynamicWidth * 0.85, height: dynamicHeight * 0.70)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 20))
                //.shadow(radius: 15, x: 2, y: -2)
                .shadow(color:
                            Color(red: 0, green: 0, blue: 0, opacity: 0.25)
                        ,radius: 8,
                        x: 6, y: 8)
            
            VStack(spacing: 20) {
                Image(cardCharacterModel.character)
                    .resizable()
                    .scaledToFit()
                    .frame(width: cardCharacterModel.imageFrameWidth)
                    .shadow(color:
                                Color(red: 0, green: 0, blue: 0, opacity: 0.25)
                            ,radius: 8,
                            x: 6, y: 8)
                
                Text(cardCharacterModel.characterFullName)
                    .foregroundStyle(Color(cardCharacterModel.darkColor))
                    .font(Font.system(size: 35, design: .rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .shadow(color:
                                Color(red: 0, green: 0, blue: 0, opacity: 0.10)
                            ,radius: 0.1,
                            x: 1, y: 1)
                
                StartButtonView(
                    darkColor:  cardCharacterModel.darkColor,
                    lightColor: cardCharacterModel.lightColor
                )
                .padding()
                
                

    
            }
    
            
            
        }
        
        
    }
    
    
    
}

#Preview {
    CardView(cardCharacterModel: cardCharacterData[0])
}
