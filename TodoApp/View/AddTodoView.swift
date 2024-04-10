//
//  AddTodoView.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var Showshould_AddTodoView: Bool
    @Binding var TodoList: [TodoModel]
    
    @State var AddTodoTitle: String = ""
    @State var AddTodoDetails: String = ""
    
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
                    Text("予定を追加").font(.title).fontWeight(.bold).foregroundColor(Color.black).padding()
                }
                Spacer()
                Text("タイトル").foregroundColor(Color.black)
                TextField("タップして入力", text: $AddTodoTitle).frame(width: 280, height: 50).background(Color.gray.opacity(0.4)).foregroundColor(colorScheme == .dark ? Color.black : Color.white).cornerRadius(10)
                Text("詳細").foregroundColor(Color.black).padding()
                TextField("タップして入力", text: $AddTodoDetails).frame(width: 280, height: 50).background(Color.gray.opacity(0.4)).foregroundColor(colorScheme == .dark ? Color.black : Color.white).cornerRadius(10)
                Spacer()
                Button(action: {
                    TodoList.append(TodoModel(Tag: "", Title: AddTodoTitle, Details: AddTodoDetails, Check: false))
                    Showshould_AddTodoView = false
                    saveTodos()
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
        //キーボードの閉じるボタン
        .toolbar{
            ToolbarItem(placement: .keyboard) {
                Button("閉じる") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            }
        }
    }
    func saveTodos() {
        if let encodedData = try? JSONEncoder().encode(TodoList) {
            UserDefaults.standard.set(encodedData, forKey: "TodoList_Key")
        }
    }
}
