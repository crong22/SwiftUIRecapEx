//
//  CoinView.swift
//  SwiftUIRecapEx
//
//  Created by Woo on 9/4/24.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    roundRectangle()
                }
                .navigationTitle("My Money")
            }
        }
    }
    
    func roundRectangle() -> some View{
        ZStack{
        RoundedRectangle(cornerRadius: 25)
            .fill(.blue)
            .frame(height: 150)
            .padding(.horizontal)
            .overlay(alignment: .leading) {
                Circle()
                    .fill(.white.opacity(0.4))
                    .scaleEffect(2)
            }
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 쇼핑내역")
                    .font(.caption.bold())
                Text("154,140,420")
                    .font(.largeTitle.bold())
            }
            .foregroundColor(.white)
            .padding(25)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
            
    }
}


#Preview {
    CoinView()
}
