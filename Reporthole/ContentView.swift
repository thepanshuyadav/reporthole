//
//  ContentView.swift
//  Reporthole
//
//  Created by Deepanshu Yadav on 30/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    
            }
            NewComplaintMapView()
                .tabItem {
                    VStack{
                        Image(systemName: "plus.square.fill")
                        Text("New Complaint")
                    }
                    
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
