//
//  NewComplaintDetailView.swift
//  Reporthole
//
//  Created by Deepanshu Yadav on 30/04/20.
//  Copyright © 2020 Deepanshu Yadav. All rights reserved.
//

import SwiftUI

struct NewComplaintDetailView: View {
    @State var details = ""
    @State var img = Data.init(count: 0)
    @State var shown = false
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                Divider()
                TextField("Add details", text: $details)
                    .frame(width: UIScreen.main.bounds.width-20, height: 50, alignment: .leading)
                    .lineLimit(1)
                    .font(.headline)
                    .accentColor(.blue)
                Divider()
                VStack{
                    if img.count != 0 {
                        Image(uiImage: UIImage(data: img)!)
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width-10, height: 300, alignment: .center)
                            .cornerRadius(20)
                    }else{
                        Image("test")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width-10, height: 300, alignment: .center)
                            .cornerRadius(20)
                    }
                    VStack(spacing: 10){
                        HStack{
                            Spacer()
                            Button(action: {
                                self.shown.toggle()
                            }) {
                                Text("Select Image")
                            }
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .sheet(isPresented: $shown) {
                                picker(shown: self.$shown, image: self.$img)
                            }
                            Spacer()
                            Spacer()
                            Button(action: {
                                self.img.count=0
                            }) {
                                Text("Remove Image")
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            Spacer()
                            
                            
                        }
                        Spacer()
                        if img.count != 0{
                        Button("File Complaint"){
                            
                        }.frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    
                    
                }.animation(.spring())
                Spacer()
                
            }
            .navigationBarTitle("New Complaint", displayMode: .large)
        }
        
    }
}

struct NewComplaintDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewComplaintDetailView()
    }
}
struct picker: UIViewControllerRepresentable {
    @Binding var shown: Bool
    @Binding var image : Data
    func makeCoordinator() -> picker.Coordinator {
        return Coordinator(img: $image, shown1: $shown)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<picker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<picker>) {
        
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        @Binding var shown: Bool
        @Binding var image : Data
        init(img: Binding<Data>,shown1: Binding<Bool>) {
            _image = img
            _shown = shown1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            shown.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let importedImage = info[.originalImage] as! UIImage
            image = importedImage.jpegData(compressionQuality: 80)!
            shown.toggle()
        }
    }
}

