//
//  ContentView.swift
//  SwiftUIRecapEx
//
//  Created by Woo on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    Text(" ")
                    Text("HELLO,")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("MY POLAAROID")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .padding(.horizontal)
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 450)
                    .padding(.horizontal)
                Spacer()
                NavigationLink("시작하기") {
                    TransitionView()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
            }
        }

    }
}

struct TransitionView : View {
    @State private var isSheetPresented = false
    
    init() {
        print("TransitionView init")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Button("다음") {
                    isSheetPresented = true
                }
            }
            .sheet(isPresented: $isSheetPresented, content: {
                OtherView()
            })
        }
    }
}

struct OtherView : View {
    
    init() {
        print("OtherView init")
    }
    
    var body: some View {
        Text("🍟화면전환테스트🍟")
            .onAppear{
                print("OtherView onAppear")
            }
            .onDisappear{
                print("OtherView onDisappear")
            }
    }
}

#Preview {
    ContentView()
}
