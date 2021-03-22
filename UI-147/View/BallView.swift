//
//  BallView.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/22.
//

import SwiftUI

struct BallView: View {
    @State var rotateBall = false
    @State var showpopup = false
    @Environment(\.colorScheme) var scheme
    
    init() {

        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor:UIColor.red,.font : UIFont(name: "Arial-BoldMT", size: 70)!
                
        ]
    }
    var body: some View {
        NavigationView{
            
            VStack{
                
                Toggle(isOn: $rotateBall, label: {
                    
                    Text("Rotation")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.5)
                        
                        
                    
                    
                })
                .padding()
                .padding(.vertical)
                
                
                Button(action: {
                    withAnimation(.spring()){showpopup.toggle()}
                    
                }) {
                    Text("Show Pop UP")
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(scheme == .dark ? Color.green : Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: 5)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack{
                    
                    if showpopup{
                        
                        Color.primary.opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.spring()){
                                    showpopup.toggle()
                                }
                            }
                        DribleView(rotateBall: $rotateBall, showpopup: $showpopup)
                            .offset(y: showpopup ? 0 : UIScreen.main.bounds.height)
                    }
                }
            
            
            )
            .navigationTitle("Nike BALL")
            .navigationBarHidden(true)
            
            
            
        }
        
    }
}

struct BallView_Previews: PreviewProvider {
    static var previews: some View {
        BallView()
    }
}

struct DribleView : View {
    @Environment(\.colorScheme) var scheme
    @Binding var rotateBall : Bool
    @Binding var showpopup : Bool
    
    @State var animatedBall = false
    @State var animateRotaion = false
    var body: some View{
        
        
        ZStack{
            (scheme == .dark ? Color.black : Color.white)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                .padding(.vertical,10)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: 5)

            
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .rotation3DEffect(.init(degrees: 60), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 0, perspective: 1.0)
               
                .offset(y: 80)
                .opacity(animatedBall ? 1 : 0)
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .rotationEffect(.init(degrees: rotateBall && animateRotaion ? 360 : 0))
                .offset(y: animatedBall ? -80 : -25)
            
            
        }
        .onAppear(perform: {
            
            DoAnimation()
            
            
        })
       
    }
    func DoAnimation(){
        
        withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)){
            
            
            animatedBall.toggle()
        }
        withAnimation(Animation.linear(duration: 0.1).repeatForever(autoreverses: false)){
            
            
            animateRotaion.toggle()
        }
        
        
        
    }
}
