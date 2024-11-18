//
//  ListView.swift
//  myToDoListV2
//
//  Created by Alem Nabiyev on 11/10/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach (listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                     //   ListRowView(title: item)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("To-Do List😅")
        .navigationBarItems(
            leading: EditButton(),
                            trailing:
                NavigationLink("Add", destination: AddView())
                                               )
        }
        }
                            
                            



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView ()
        }
                .environmentObject(ListViewModel())

    }
}

