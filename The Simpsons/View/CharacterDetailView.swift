//
//  CharacterDetailView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    // NOT: Tamamiyle diger olusturdugumuz yardimci View sayfalarinin bir araya ozenle NavStack ScrollView ve Group gibi yapilarin icerisinde toplanmasiyla olusturulmus bir sayfa. Bazi Baslik olarak ekledigim gruplar icerisinde Text degerleride ayri bir sayfada yazilip kodumuz daha da kisaltilabilirdi fakat bu projeyi tamamiyle keyif icin ve daha sonra kullanilabilecek hazir kod oruntuleri olusturmak adina yaptigimdan cokta ugrasmadim.
    // TODO: - Projeyi sizde yapmak isterseniz 83-93 ve 53-62 satirlarindaki HStacki alarak HeadlineView seklinde yeni bir sayfada View klasoru icerine atarak CharacterDetailView Sayfamizi daha derli toplu hale getirebiliriz.
    // MARK: - CLEAN CODING FOREVER!!!
    
    let simpsons: SimpsonsJsonModel
    
    var body: some View {
        
        
        NavigationStack{
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .center, spacing: 20){
                    // HERO IMAGE
                    Image(simpsons.image)
                        .resizable()
                        .scaledToFit()
                    
                    // TITLE
                    Text(simpsons.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .foregroundStyle(.primary)
                        .background(
                            Color.black
                                .frame(height: 6)
                                .offset(y: 24)
                        )
                    
                    // HEADLINE
                    Text(simpsons.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    
                    // GALLERY
                    Group{
                        HStack{
                            Image(systemName: "photo.on.rectangle.angled")
                                .foregroundStyle(.black)
                                .imageScale(.large)
                            
                            Text("Images")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                        
                        //InsetGalleryView(animal: animal)
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(alignment: .center, spacing: 20){
                                ForEach(simpsons.gallery, id: \.self) { item in
                                    Image(item)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                    .clipShape(.rect(cornerRadius: 12))
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    

                    // DESCRIPTION
                    Group{
                        HStack{
                            Image(systemName: "info.circle")
                                .foregroundStyle(.black)
                                .imageScale(.large)
                            
                            Text("Some Information")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                        
                        Text(simpsons.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                        
                    }
                    .padding(.horizontal)

                    // LINK
                    
                    ExternalWebLinkView(simpsons: simpsons)
                }
                
            }
            .navigationTitle("Learn about \(simpsons.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
        
        
        
        
    }
    
    
    
    //MARK: - FUNC FOR PREVIEW VIEW
    static func preview() -> some View {
            let simpsons: [SimpsonsJsonModel] = Bundle.main.decode("simpsons.json")
            return CharacterDetailView(simpsons: simpsons[0])
        }
    
}

#Preview {
    CharacterDetailView.preview()
}
