//
//  CardCharacterModel.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/25/23.
//

import Foundation

// Olusturdugumuz bu model ile Lokal olarak olusturacagimiz Data/CardCharacterData.swift dosyasinda kullanarak karakterlerimize ait bilgileri rahatlikla saklayacagimiz bir kalip elde ediyoruz
// NOT: fallingObject degerimiz optinal olarak tanimlandi cunku bu modeli CoverImageView icerisinde kullanirken sadece 5 adet karakterin fallingObjectView background animasyonu ile sergilenmesini istiyordum. Yani sondaki iki karakterin boyle bir obje degerine ihtiyaci olmayacakti.

struct CardCharacterModel: Identifiable {
    var id = UUID()
    var darkColor: String
    var lightColor: String
    var imageFrameWidth: CGFloat
    var character: String
    var characterFullName: String
    var fallingObject: String?
}
