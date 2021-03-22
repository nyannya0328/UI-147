//
//  CardView.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

struct CardView: View {
    var card : Card
    var animation : Namespace.ID
    @EnvironmentObject var model : HomeViewModel
    var body: some View {
        VStack{
            
            Text("21 MARCH")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.8))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                .matchedGeometryEffect(id: "Date\(card.id)", in: animation)
            
            
            HStack{
                
                Text(card.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250,alignment: .leading)
                   
                    .matchedGeometryEffect(id: "title\(card.id)", in: animation)
                Spacer()
                
            }
            .padding()
            
            Spacer(minLength: 0)
            
            HStack{
                
                
                
                
                if !model.showcontent{
                    Spacer(minLength: 0)
                    
                    Text("Read More")
                  
                    
                    Image(systemName: "arrow.right")
                }
                
                
            }
            .foregroundColor(Color.white.opacity(0.9))
            .padding()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(card.cardcolor
                        .cornerRadius(25)
                        .matchedGeometryEffect(id: "bgColor\(card.id)", in: animation)
                    //Matchのidが違うとスワイプできなくて、最初の画面も出てこない
                    
        )
        .onTapGesture {
            withAnimation(.spring()){
                
                model.selectedColor = card
                model.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    
                    
                    withAnimation(.easeIn){
                        
                        model.showcontent = true
                    }
                }
                
                
                 
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
