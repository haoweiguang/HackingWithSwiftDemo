//
//  ContentView.swift
//  Navigation
//
//  Created by 郝伟光 on 2024/7/22.
//

import SwiftUI

// struct ContentView: View {
//    @State private var path = [Int]()
//
//    var body: some View {
//        NavigationStack {
//            NavigationLink("Tap Me") {
//                Text("Detail View")
//            }
//        }

//        NavigationStack{
//            List(0..<1000){i in
//                NavigationLink("Tap Me"){
//                    DetailView(number: i)
//                }
//            }
//        }

//        NavigationStack {
//            List(0 ..< 100) { i in
//                NavigationLink("Select \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }

//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show 32") {
//                    path = [32]
//                }
//
//                Button("Show 61") {
//                    path.append(61)
//                }
//
//                Button("Show 32 then 64") {
//                    path = [32, 61]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
//    }
// }

// struct ContentView: View {
//    @State private var path=NavigationPath()
//
//    var body: some View {
//        NavigationStack(path:$path) {
//            List {
//                ForEach(0 ..< 5) { i in
//                    NavigationLink("Select Number:\(i)", value: i)
//                }
//
//                ForEach(0 ..< 5) { i in
//                    NavigationLink("Select String:\(i)", value: String(i))
//                }
//                .navigationDestination(for: Int.self) { selection in
//                    Text("You selected the number \(selection)")
//                }
//                .navigationDestination(for: String.self) { selection in
//                    Text("You selected the string \(selection)")
//                }
//            }
//            .toolbar{
//                Button("push 556"){
//                    path.append(556)
//                }
//
//                Button("push hello"){
//                    path.append("hello")
//                }
//            }
//        }
//    }
// }

// struct ContentView: View {
//    @State private var path = [Int]()
//
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { selectin in
//                    DetailView(number: selectin, path: $path)
//                }
//        }
//    }
// }
//
// struct DetailView: View {
//    var number: Int
//    @Binding var path: [Int]
//
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1 ... 1000))
//            .navigationTitle("Number:\(number)")
//            .toolbar {
//                Button("Home") {
//                    path.removeAll()
//                }
//            }
//    }
// }

// struct ContentView:View {
//    var body: some View {
//        NavigationStack{
//            List(0..<100){i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark)
//            .toolbar(.hidden,for: .navigationBar)
//        }
//    }
// }

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Hello world")
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Tap me") {
//                            // Do something
//                        }
//                    }
//
//                    ToolbarItem(placement:.topBarLeading){
//                        Button("Or Tap me"){
//                            // Do something
//                        }
//                    }
//                }
//        }
//    }
//}

struct ContentView:View {
    @State private var title="SwiftUI"
    
    var body: some View {
        NavigationStack{
            Text("Hello world")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
