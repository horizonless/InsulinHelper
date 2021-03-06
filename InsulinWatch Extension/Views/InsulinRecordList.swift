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
                ZStack{
                    InsulinCell(record: record)
                }
            }
        }
        .listStyle(CarouselListStyle())
        .navigationBarTitle(Text("Insulin Records!"))
    }
}

struct InsulinCell: View{
    var record: InsulinRecordModel
    
    var body: some View {
        HStack {
            Text("\(record.amount)").font(.title)
            VStack(alignment: .leading) {
                Text(record.time)
                .font(.system(.headline, design: .rounded))
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct InsulinRecordList_Previews: PreviewProvider {
    static var previews: some View {
        InsulinRecordList(data: RecordsListModel.recordList)
    }
}
