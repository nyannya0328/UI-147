//
//  DetatilView.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

struct DetatilView: View {
    @EnvironmentObject var model : HomeViewModel
    var animation : Namespace.ID
    var body: some View {
        ZStack{
        VStack{
            
            Text("21 MARCH")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                .matchedGeometryEffect(id: "Date\(model.selectedColor.id)", in: animation)
            
            
            HStack{
                
                Text(model.selectedColor.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250,alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "title\(model.selectedColor.id)", in: animation)
            }
            
          
            
            if model.showcontent{
                
                Text(model.content)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
            }
            
            Spacer(minLength: 0)
           
            
            
        }
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            model.selectedColor.cardcolor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor\(model.selectedColor.id)", in: animation)
                .ignoresSafeArea(.all, edges:.bottom)
                
        )
        VStack{
            
            Spacer(minLength: 0)
            
            if model.showcontent{
                
                Button(action: closeView, label: {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                        .padding(5)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                })
                .padding(.bottom,5)
                
            }
            
            
        }
        
    }
    func closeView(){
        withAnimation(.spring()){
            model.showCard.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                withAnimation(.easeIn){
                    
                    
                    model.showcontent = false
                    
                }
            
            
        }
        
       
        
        
        
        
        
    }
    }
}

struct DetatilView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
