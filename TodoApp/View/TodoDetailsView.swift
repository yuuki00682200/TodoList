//
//  TodoDetailsView.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import SwiftUI

struct TodoDetailsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var TodoList: [TodoModel]
    @Binding var Showshould_TodoDetailsView: Bool
    @State var Title: String
    @State var Details: String
    @State var index: Int
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack{
                HStack{
                    VStack{
                        Button(action: {
                            Showshould_TodoDetailsView = false
                        }){
                            VStack{
                                Image(systemName: "xmark").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.white)
                            }.frame(width: 50, height: 50).background(Color.gray).cornerRadius(50)
                        }
                    }.padding()
                    Spacer()
                    Text(Title).font(.title).fontWeight(.semibold).foregroundColor(Color.black).padding()
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("詳細").font(.title).fontWeight(.semibold).foregroundColor(Color.black)
                        Text(Details).font(.title3).fontWeight(.semibold).foregroundColor(Color.black)
                    }.padding()
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        TodoList.remove(at: index)
                        Showshould_TodoDetailsView = false
                    }){
                        VStack{
                            Image(systemName: "trash").resizable().scaledToFit().frame(width: 40, height: 40).foregroundColor(Color.white)
                        }.frame(width: 60, height: 60).background(Color.red).cornerRadius(50)
                    }.padding()
                }
            }.frame(width: 300, height: 500).background(Color.white).cornerRadius(20)
        }
    }
}
