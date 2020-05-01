//
//  HomeView.swift
//  Reporthole
//
//  Created by Deepanshu Yadav on 30/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI
import MapKit

struct HomeView: View {
    var complaint = ComplaintDetail(location: CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025), complaintNumber: "123vgxno", complaintImage: "test", complaintDescription: "av xnqyoi lcnq  cqnlygor9", date: "12/12/2020", time: "20:10")
    
    
    var body: some View {
        NavigationView{
            HStack(alignment: .top){
                VStack{
                    Group{
                        HStack(alignment: .center, spacing: 12){
                            Image(systemName: "person.crop.circle.fill").resizable()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipShape(Circle())
                            VStack{
                                Text("Profile").fontWeight(.heavy)
                                Divider()
                                VStack{
                                    Text("Bill Gates")
                                    Text("8912345678")
                                }
                                
                            }
                        }
                        .padding()
                    }
                    
                    Divider()
                    Spacer()
                    Spacer()
                    Text("Complaints").bold().font(.largeTitle)
                    
                    
                    ScrollView(.horizontal, showsIndicators: true){
                        
                        HStack(alignment: .center,spacing: 20){
                            ComplaintCellView(complaint: complaint)
                            ComplaintCellView(complaint: complaint)
                            ComplaintCellView(complaint: complaint)
                            ComplaintCellView(complaint: complaint)
                        }
                        .padding()
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
                
                
                
            .navigationBarTitle("Home", displayMode: .large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
