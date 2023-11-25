//
//  ExternalWebLinkView.swift
//  TheSimpsons
//
//  Created by Furkan Tümay on 11/26/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // Burada CharacterDetailView icerinde en altta kullandigimiz Link bolumunu olusturduk. Kodu biraz incelerseniz neler yaptigimizi rahatlikla anlayabileceginize eminim...
    
    let simpsons: SimpsonsJsonModel
    
    var body: some View {
        
        
        GroupBox {
            
          HStack {
            Image(systemName: "globe")
            Text("SimpsonsFandom")
            Spacer()
            
            Group {
              Image(systemName: "arrow.up.right.square")
              
              Link(simpsons.name, destination: (URL(string: simpsons.link) ?? URL(string: "https://simpsons.fandom.com"))!)
            }
            .foregroundColor(.accentColor)
          }
            
        }
        .padding()
        
        
    }
    
    //MARK: - FUNC FOR PREVIEW VIEW
    static func preview() -> some View {
            let simpsons: [SimpsonsJsonModel] = Bundle.main.decode("simpsons.json")
            return CharacterDetailView(simpsons: simpsons[4])
        }
    
    
}

#Preview {
    ExternalWebLinkView.preview()
}
