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
    
    
    init(data : [InsulinRecordModel]){
        self.records   = data
    }
    
    mutating func AddRecord(record : InsulinRecordModel){
        self.records.append(record)
    }
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
//    static let previewRecordsListModel = RecordsListModel(records: [InsulinRecordModel.previewIndulinRecordModel, InsulinRecordModel(time: "5:00", amount: 10, type: InsulinType.LongActiong)])
    static var recordList = RecordsListModel(data: [])
}
