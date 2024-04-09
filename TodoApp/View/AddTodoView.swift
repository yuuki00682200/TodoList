//
//  AddTodoView.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var AddTodoTitle: String = ""
    @Binding var Showshould_AddTodoView: Bool
    @Binding var TodoList: [TodoModel]
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea()
            VStack{
                HStack{
                    Button(action: {
                        Showshould_AddTodoView = false
                    }){
                        VStack{
                            Image(systemName: "xmark").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.white)
                        }.frame(width: 50, height: 50).background(Color.gray).cornerRadius(50)
                    }.padding()
                    Spacer()
                    Text("予定を追加").font(.title).fontWeight(.bold).padding()
                }
                Spacer()
                TextField("タップして入力", text: $AddTodoTitle).frame(width: 280, height: 50).background(Color.gray.opacity(0.4)).cornerRadius(10)
                Spacer()
                Button(action: {
                    TodoList.append(TodoModel(Tag: "", Title: AddTodoTitle, Details: "", Check: false))
                    Showshould_AddTodoView = false
                }){
                    VStack{
                        VStack{
                            Image(systemName: "plus").resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(Color.white)
                        }.frame(width: 60, height: 60).background(Color.green).cornerRadius(50)
                        Text("追加する").foregroundStyle(Color.black)
                    }
                }.padding()
            }.frame(width: 300, height: 500).background(Color.white).cornerRadius(20)
        }
    }
}
