//
//  StartButton.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct StartButtonView: View {
    
    var darkColor: String
    var lightColor: String
    
    // openHome adinda degiskenimizi tanimliyoruz ki bu degisken acilista false olarak belirleniyor fakat kullanici butona tikladigi zaman bu deger true olarak degisiyor ve @State sayesinde degerin degistigi algilanip butonun en sonunda belirttigimiz fullScreenCover ile HomePageView'a yonlendirmemizi sagliyoruz
    
    // DIP NOT ve ONERI: Burada UX anlaminda bir gelistirme saglamak amaciyla @AppStorage kullanilarak kullanici start butonuna bir kez bastiysa openHome degerinin hem true olarak hatirlanmasi saglanabilir ve App/TheSimpsonsApp icerisinde direkt olarak HomePageView'a yonlendirme saglanabilir
    @State private var openHome: Bool = false
    
    var body: some View {
        
        // Burada daha derli toplu bir kod elde etmek adina OnboardingView icerindeki kartta kullanacagimiz butonun tasarimini yapiyorum ki daha sonra rahatlikla StartButtonView() diyerek cagirabilelim.
        
        ///-----START BUTTON
        Button(
            action: {
                openHome = true
            },
            label: {
                
                HStack(alignment: .center, spacing: 8) {
                    Text("Start")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .imageScale(.large)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    Capsule().strokeBorder(style: StrokeStyle(lineWidth: 5))
                )
                .foregroundStyle(LinearGradient(colors: [Color(darkColor), Color(lightColor)], startPoint: .top, endPoint: .bottom))
                .shadow(color:.black.opacity(0.1), radius: 0.1, x: 1, y: 1)
                
            }
        )///-----END BUTTON
        .fullScreenCover(isPresented: $openHome, content: {
            HomePageView()
        })
        
        
    }
    
    
    
}

#Preview(traits: .sizeThatFitsLayout) {
    StartButtonView(darkColor: "homerdark", lightColor: "homerlight")
        .padding()
}
