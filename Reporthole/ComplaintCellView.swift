//
//  ComplaintCellView.swift
//  Reporthole
//
//  Created by Deepanshu Yadav on 30/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI
import MapKit

struct ComplaintCellView: View {
    var complaint: ComplaintDetail
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            VStack{
                CellMapView(locationCoordinate: complaint.location)
                    .frame(width: UIScreen.main.bounds.width-30,height: 250)
                    .offset(y: -20)
                    .disabled(true)
            }
            VStack(alignment: .leading,spacing: 8) {
                Text(complaint.complaintNumber)
                    .font(.title)
                    .foregroundColor(.white)
                HStack(alignment: .top) {
                    Text(complaint.date)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text(complaint.time)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(8)
        }
        .padding(18)
        .frame(width: UIScreen.main.bounds.width-30)
        .background(LinearGradient(gradient: Gradient(colors: [.white,.gray,.black]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .shadow(radius: 10)
        .zIndex(25)
    }
}

struct CellMapView: UIViewRepresentable {
    var locationCoordinate:CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.0002, longitudeDelta: 0.0002)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}
