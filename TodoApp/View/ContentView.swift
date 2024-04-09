//
//  ContentView.swift
//  TodoApp
//
//  Created by kaito on 2024/04/09.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State var TodoList: [TodoModel] = []
    
    @State var TapTodoindex: Int = 00
    @State var TapTodoTitle: String = ""
    @State var TapTodoDetails: String = ""
    
    @State private var Showshould_AddTodoView = false
    @State private var Showshould_TodoDetailsView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    ScrollView{
                        ForEach(0..<TodoList.count, id: \.self) { index in
                            HStack{
                                Button(action: {
                                    TapTodoTitle = TodoList[index].Title
                                    TapTodoDetails = TodoList[index].Details
                                    Showshould_TodoDetailsView = true
                                }){
                                    Text(TodoList[index].Title).font(.title).foregroundColor(.black).padding()
                                }
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
                            
                        }){
                            VStack{
                                Image(systemName: "text.justify.leading").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            }.frame(width: 40, height: 40).background(colorScheme == .dark ? Color.white : Color.black).cornerRadius(50)
                        }
                        Button(action: {
                            Showshould_AddTodoView = true
                        }){
                            VStack{
                                Image(systemName: "plus").resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            }.frame(width: 60, height: 60).background(colorScheme == .dark ? Color.white : Color.black).cornerRadius(50)
                        }.padding()
                    }
                }
                if Showshould_AddTodoView{
                    AddTodoView(Showshould_AddTodoView: $Showshould_AddTodoView, TodoList: $TodoList)
                } else if Showshould_TodoDetailsView{
                    TodoDetailsView(TodoList: $TodoList, Showshould_TodoDetailsView: $Showshould_TodoDetailsView, Title: TapTodoTitle, Details: TapTodoDetails, index: TapTodoindex)
                }
            }
        }.onAppear{
            if let todolist = UserDefaults.standard.object(forKey: "TodoList_Key") as? [TodoModel] {
                TodoList = todolist
            }
        }
    }
}

#Preview {
    ContentView()
}
