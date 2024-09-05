//
//  RandomView.swift
//  SwiftUIRecapEx
//
//  Created by Woo on 9/5/24.
//

import SwiftUI

struct RandomView: View {
    
    let url = URL(string: "https://picsum.photos/120/160")
    
    @State var listname = [
        TitleName(name: "첫번째"),
        TitleName(name: "두번째"),
        TitleName(name: "세번째"),
        TitleName(name: "네번째")
        ]
    
    @State var name = ""
    
    var body: some View {
        NavigationView {
                ScrollView {
                    ForEach(listname, id: \.id) { data in
                        imageView(num: data.name! )
                    }
            }
        }
    }
    
    func imageView(num : String) -> some View {
        VStack(alignment : .center) {
            Text(num)
                .frame(maxWidth: .infinity, alignment : .leading)
                .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: true) {
                HStack {
                    ForEach(0..<5) { _ in
                        AsyncImage(url: url) { data in
                        switch data {
                        case .empty:
                            ProgressView()
                                .frame(width: 120, height: 160)
                        case .success(let image):
                            NavigationLink {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 120, height: 160)
                                    .overlay(alignment : .center) {
                                        image
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                Text(num)
                                TextField("변경 값 입력 \(name)", text: $name)
                                    .frame(width: 300, height: 30)
                                    .border(Color.black, width: 2)
                                    .textCase(.lowercase)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(false)
                            }label: {
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 120, height: 160)
                                        .overlay(alignment : .center) {
                                            image
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                }
                        case .failure(let error):
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 120, height: 160)
                        @unknown default:
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 120, height: 160)
                        }
                    }

                        
                    }
                }
                
                

            }
            .navigationTitle("My Random Image")
        }
    }
}



#Preview {
    RandomView()
}
