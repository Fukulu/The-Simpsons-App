//
//  SimpsonsJsonModel.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import Foundation

// Olusturdugumuz bu modeli JSON formatinda cozumleme yapmak icin kullanacagiz. Bu modeli daha onceden hazirladigimiz Data/simpsons.json dosyamizdaki JSON yapisina gore olusturdukki cozumleme islemini yapacagimiz sirada herhangi bir hata almayalim. Cozumleyici fonksiyonumuz Extension/CodableBundleExtension.swift dosyasinda bulunuyor.

struct SimpsonsJsonModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
}
