//
//  FallingObjectView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import SwiftUI

struct FallingObjectSetupView: View {
    
    @State private var isAnimating: Bool = false
    @State var offsetY: CGFloat
    var offsetX: CGFloat
    var fallingObject: String
    
    // Burada yukaridan asagiya dogru dusen obje efektinin oncelikle temel yapisini oturttuk. Asagidaki fonksiyonu inceleyecek olursak yukaridan asagiya birbirleri arasinda 30 bosluk birakilan 100 adet donut objesi olusturuluyor. offset y duzleminde -50 yani ekranin uzerinde bir noktadan basliyor ardindan donutlarin ekran uzunlugundan +50 offset y duzeleminde ilerlemesi surecini linear bir animasyona donusturuyoruz
    
    // Ikinci adimda yeni bir VStack daha acarak ayni islemi uyguluyoruz fakat bu sefer hem y hem x duzleminde gerekli bosluk ayarlamalarini yaparak ikinci donut dizilimimizi elde ediyor ve her iki donut VStacklerini aralarinda mesafeyi belirleyecek HStack icerisinde yanyana getiriyoruz.
    
    // Burada offsetX ve offsetY degiskenlerini olusturmamizin sebebi daha sonra bu yapiyi tekrar ve tekrar cagirarak daha buyuk ekranlara gore yanyana eklememizi saglayacak olmasi. View/FallingObjectView.swiftui dosyasina giderek kullanimini inceleyebilirsiniz.
    
    
    var body: some View {
        
        
        ZStack {
            
            HStack(spacing: 10) {

                VStack(spacing: 30) {
                    ForEach(0..<100, id: \.self) { _ in
                        Text(fallingObject)
                            .opacity(0.5)
                            .colorMultiply(.white)
                            .font(.system(size: 50))
                            .offset(x:offsetX, y: offsetY)
                            .animation(
                                Animation
                                    .linear(duration: 3)
                                    .speed(0.3)
                                    .repeatForever(autoreverses: false)
                                ,
                                value: isAnimating)
                    }
                }
                .onAppear {
                    offsetY = UIScreen.main.bounds.height + 50
                    isAnimating = true
                }
                
                VStack(spacing: 30) {
                    ForEach(0..<100, id: \.self) { _ in
                        Text(fallingObject)
                            .opacity(0.5)
                            .colorMultiply(.white)
                            .font(.system(size: 50))
                            .offset(x:(offsetX+30), y: (offsetY+50))
                            .animation(
                                Animation
                                    .linear(duration: 3)
                                    .speed(0.3)
                                    .repeatForever(autoreverses: false)
                                ,
                                value: isAnimating)
                    }
                }
                .onAppear {
                    offsetY = UIScreen.main.bounds.height + 50
                    isAnimating = true
                }
            }
            
        }
        
        
    }
    
    
    
}

#Preview {
    FallingObjectSetupView(offsetY: -50, offsetX: 0, fallingObject: "🍩")
}
