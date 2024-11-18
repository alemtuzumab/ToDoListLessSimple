//
//  ListViewModel.swift
//  myToDoListV2
//
//  Created by Alem Nabiyev on 11/10/24.
//

import Foundation
//CRUD Functions - create read update delete
class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
        
    }
    
    func getItems(){
//        let newItems = [ItemModel(title: "First Item" , isCompleted: false),
//                        ItemModel(title: "Second Item", isCompleted: true),
//                        ItemModel(title: "Third Item", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
             let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems 
    }
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem ( from:  IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel){
            
//        if let index = items.firstIndex{ ( existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            //run this code
//        }
        if let index = items.firstIndex( where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItems(){
        if let encodeedData = try? JSONEncoder().encode(items){
             UserDefaults.standard.set(encodeedData, forKey: itemsKey)
        }
    }
}
