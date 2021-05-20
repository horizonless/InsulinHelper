//
//  InsulinRecordList.swift
//  InsulinWatch Extension
//
//  Created by Shenrui Zhang on 5/20/21.
//

import Foundation
import SwiftUI
import Combine

struct InsulinRecordList: View {
    var data: RecordsListModel

    var body: some View {
        List {
            ForEach(data.records, id: \.id) { record in
                NavigationLink(destination: InsulinCell(record: record)) {
                }
//                .listRowPlatterColor(Color(topic.color))
            }
//            .onMove { self.data.moveTopic(from: $0, to: $1) }
//            .onDelete { self.data.deleteTopic(at: $0) }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Pop Quiz!"))
//        List {
//            VStack {
//                ForEach(data.records, id: \.id) { result in
//                    Text("Result: \(result.time)")
//                }
//            }
//        }
    }
}

struct InsulinCell: View{
    var record: InsulinRecordModel
    
    var body: some View {
        HStack {
            Text("\(record.amount)").font(.title)
            VStack(alignment: .leading) {
                Text(record.time).font(.system(.headline, design: .rounded))
//                Text(record.type)
            }
        }
    }
}

struct InsulinRecordList_Previews: PreviewProvider {
    static var previews: some View {
        InsulinRecordList(data: RecordsListModel.previewRecordsListModel)
    }
}
