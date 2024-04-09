//
//  ContentView.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import SwiftUI

struct ContentView: View {
    @State var TodoList: [TodoModel] = [
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false),
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false),
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false),
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false),
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false),
        TodoModel(Tag: "a", Title: "a", Details: "a", Check: false)
    ]
    
    @State private var Showshould_AddTodoView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    ScrollView{
                        ForEach(0..<TodoList.count, id: \.self) { index in
                            HStack{
                                Text(TodoList[index].Title).font(.title).padding()
                                Spacer()
                                Button(action: {
                                    if !TodoList[index].Check{
                                        TodoList[index].Check = true
                                    } else {
                                        TodoList[index].Check = false
                                    }
                                }){
                                    VStack{
                                        Image(systemName: TodoList[index].Check
                                              ? "checkmark" : "").resizable().scaledToFit().frame(width: 25, height: 25).foregroundColor(Color.black)
                                    }.frame(width: 50, height: 50).border(Color.black)
                                }.padding()
                            }.frame(width: 350, height: 60).background(Color.white).shadow(radius: 10)
                        }
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            Showshould_AddTodoView = true
                        }){
                            VStack{
                                Image(systemName: "plus").resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(Color.white)
                            }.frame(width: 60, height: 60).background(Color.black).cornerRadius(50)
                        }.padding()
                    }
                }
                if Showshould_AddTodoView{
                    AddTodoView(Showshould_AddTodoView: $Showshould_AddTodoView, TodoList: $TodoList)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
