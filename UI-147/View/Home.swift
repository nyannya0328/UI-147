//
//  Home.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : HomeViewModel
    var width = UIScreen.main.bounds.width
    @Namespace var animation
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack{
                    
      
                    NavigationLink(destination: BallView()) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .padding()
                    }
                           
                           
                
                    Text("Color")
                      
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding()
               
                
             
               
                
                ZStack{
                    
                    ForEach(model.cards.indices.reversed(),id:\.self){index in
                        
                        HStack{
                            
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getcardWithIndex(index: index), height: getcardHeightIndex(index: index))
                               
                                .offset(x: getoffset(index: index))
                                .rotationEffect(.init(degrees: getCardRotation(index: index)))
                            
                            Spacer(minLength: 0)
                        }
                        .frame(width: 400)
                        .contentShape(Rectangle())
                        .offset(x: model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance:0).onChanged({ (value) in//1回元のメソッドを出してvalueを使いしてfunc
                            onChanged(value: value, index: index)
                        }).onEnded({ (value) in
                            onEnded(value: value, index: index)
                        }))
                    }
                    
                    
                }
                .padding(.top,25)
                .padding(.horizontal,30)
                
                Button(action: RestView) {
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                     
                    
                }
                .padding(.top,55)
                
                Spacer()
            }
            
            if model.showCard{
                
                DetatilView(animation: animation)
            }
        }
    }
    
    func RestView(){
        
        for index in model.cards.indices{
            
            
            withAnimation(.spring()){
                
                model.cards[index].offset = 0
                model.swipedCard = 0
                
            }
        }
        
        
    }
    
    func getCardRotation(index : Int) ->Double{
        
        let boxWidth = Double(width / 3)
        let offset = Double(model.cards[index].offset)
        let angle : Double = 5
        return (offset / boxWidth) * angle
        
        
        
    }
    
    func onChanged(value : DragGesture.Value,index : Int){
        
        if value.translation.width < 0 {
            
            model.cards[index].offset = value.translation.width
        }
        
        
    }
    
    func onEnded(value : DragGesture.Value,index : Int){
        
        withAnimation{
            
            if -value.translation.width > width / 3{
                
                model.cards[index].offset = -width
                model.swipedCard += 1
                
            }
            else{
                
                model.cards[index].offset = 0
            }
            
        }
        
    }
    
    func getcardHeightIndex(index : Int)->CGFloat{
        
        let hegith : CGFloat = 400
        let cardHeight = index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 35 : 70
        
        
       return hegith - cardHeight
    }
    func getcardWithIndex(index : Int)->CGFloat{
        
        
        let boxWith = UIScreen.main.bounds.width - 60 - 60
        //let cardWith = index <= 2 ? CGFloat(index) * 30 : 60
        
        return boxWith
    }
    
    func getoffset(index : Int)->CGFloat{
        
        return index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 30 : 60
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
