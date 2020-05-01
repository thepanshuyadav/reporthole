//
//  NewComplaintMapView.swift
//  Reporthole
//
//  Created by Deepanshu Yadav on 30/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI
import MapKit

struct NewComplaintMapView: View{
    @State var title = ""
    @State var subTitle = ""
    @State var uploadImage = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                MapView(title: self.$title,subTitle: self.$subTitle).edgesIgnoringSafeArea(.all)
                if self.title != ""{
                    HStack(alignment: .center, spacing: 12){
                        ZStack{
                            Color.blue.opacity(0.99)
                                .frame(maxWidth: .infinity, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            HStack{
                                Spacer()
                                Spacer()
                                Spacer()
                                Image(systemName: "location.fill").font(.largeTitle).foregroundColor(.black)
                                Spacer()
                                VStack(alignment: .leading, spacing: 15){
                                    Text(self.title).font(.headline).foregroundColor(.white)
                                    Text(self.subTitle).font(.subheadline).foregroundColor(.white)
                                }
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .padding(10)
                    .background(Color("Color"))
                    .cornerRadius(15)
                }
                
            }
            .navigationBarTitle("Choose Location", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.uploadImage=true
                
            }, label: {
                Image(systemName: "camera").resizable()
                    .frame(width: 30, height: 25)
            }))
                .sheet(isPresented: self.$uploadImage) {
                    NewComplaintDetailView()
            }
            
        }
    }
}
struct MapView: UIViewRepresentable{
    @Binding var title: String
    @Binding var subTitle: String
    func makeCoordinator() -> MapView.Coordinator {
        return MapView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let map = MKMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.270)
        map.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        map.delegate = context.coordinator
        map.addAnnotation(annotation)
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
    }
    class Coordinator: NSObject,MKMapViewDelegate{
        var parent: MapView
        init(parent1: MapView){
            parent = parent1
        }
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let pin=MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pin.isDraggable = true
            pin.tintColor = .red
            pin.animatesDrop=true
            return pin
        }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)){(places,err) in
                if err != nil {
                    //Show error
                }
                self.parent.title = (places?.first?.name ?? places?.first?.postalCode)!
                self.parent.subTitle = (places?.first?.locality ?? places?.first?.country ?? "None")
            }
        }
        
    }
}
