//
//  ContentView.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = HomeViewModel()
    var body: some View {
        NavigationView{
            
            Home()
                .navigationBarHidden(true)
            .environmentObject(model)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
