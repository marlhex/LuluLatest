//
//  ListSortView.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import SwiftUI
import SwiftData

struct ListSortView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var garments: [Garment]

    init(sortOrder: SortOption) {
        let sortDescriptors: [SortDescriptor<Garment>] = switch sortOrder {
        case .alpha:
            [SortDescriptor(\Garment.name)]
        case .creationTime:
            [SortDescriptor(\Garment.creationTime, order: .reverse)]
        }
        _garments = Query(sort: sortDescriptors)
    }

    var body: some View {
        List(garments) { garment in
            Text(garment.name)
        }
        Spacer()
    }
}

#Preview {
    ListSortView(sortOrder: .alpha)
}
