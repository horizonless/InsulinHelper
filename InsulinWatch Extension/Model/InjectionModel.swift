//
//  InjectionModel.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 5/20/21.
//

import Foundation

enum InsulinType : String {
    case FastActing  = "fastacting"
    case LongActiong = "longacting"
}

struct RecordsListModel: Identifiable{
    var id = UUID()
    var records: [InsulinRecordModel]
    
//    /// Moves the a topic to a new index.
//    /// - Parameter source: The set of indexes that are being moved.
//    /// - Parameter destination: The index of the destination.
//    func moveTopic(from source: IndexSet, to destination: Int) {
//        guard let index = source.first else {
//            return
//        }
//        let element = records.remove(at: index)
//        records.insert(element, at: destination)
//    }
//
//    /// Remove a topic at the particular index.
//    /// - Parameter indices: The set of indexes to be removed.
//    func deleteTopic(at indices: IndexSet) {
//        indices.forEach { records.remove(at: $0) }
//    }
}

struct InsulinRecordModel: Identifiable{
    var id = UUID()
    let time: String
    let amount: Int
    let type: InsulinType
    
    init(time: String, amount: Int, type: InsulinType){
        self.time   = time
        self.amount = amount
        self.type   = type
    }
}

extension InsulinRecordModel {
    static let previewIndulinRecordModel = InsulinRecordModel(time: "10:17", amount: 25, type: InsulinType.FastActing)
}

extension RecordsListModel {
    static let previewRecordsListModel = RecordsListModel(records: [InsulinRecordModel.previewIndulinRecordModel, InsulinRecordModel(time: "second", amount: 10, type: InsulinType.LongActiong)])
}
