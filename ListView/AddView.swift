//
//  AddView.swift
//  myToDoListV2
//
//  Created by Alem Nabiyev on 11/10/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    //watch vid on environments 
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack{
            TextField("type something here", text: $textFieldText)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                
                Button(action: saveButtonPressed, label:{
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            //#colorLiteral()
        }
                       
        .padding(14)
        }
        .navigationTitle("Add an item 🥸")
        .alert(isPresented: $showAlert, content: getAlert)
            
        }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your item is too short 🙊"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert ( title: Text(alertTitle))
    }
}


struct AddView_Provider: PreviewProvider{
    static var previews: some View {
        Group{
            NavigationView{
                AddView()
            }
            .environmentObject(ListViewModel())
            }
        }
    }
