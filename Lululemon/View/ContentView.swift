//
//  ContentView.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var garments: [Garment]
    @State private var isAddingGarment = false
    @State private var sortOrder = SortOption.alpha
    @State private var showingDeleteAlert = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Picker("Sort Option", selection: $sortOrder) {
                    ForEach(SortOption.allCases) { sortOrder in
                        Text("Sort By \(sortOrder.rawValue)").tag(sortOrder)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color(UIColor.systemBackground))

                if garments.isEmpty {
                    Spacer()
                    Text("List is empty, add your first element")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    ListSortView(sortOrder: sortOrder)
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    showingDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                }
                .disabled(garments.isEmpty),
                trailing: Button(action: {
                    isAddingGarment = true
                }) {
                    Image(systemName: "plus.circle")
                }
            )
        }
        .fullScreenCover(isPresented: $isAddingGarment) {
            AddGarmentView(isPresented: $isAddingGarment, garmentCount: garments.count)
        }
        .alert("Delete All Garments", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteAllGarments)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete all garments?")
        }
    }

    private func deleteAllGarments() {
        for garment in garments {
            modelContext.delete(garment)
        }
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Garment.self, inMemory: true)
}
