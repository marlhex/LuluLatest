//
//  AddGarmentView.swift
//  Lululemon
//
//  Created by Ignacio Arias on 2024-04-15.
//

import SwiftUI
import SwiftData

struct AddGarmentView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @State private var garmentName = ""
    @State private var showingLimitAlert = false
    let garmentCount: Int

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Divider()

                Text("Garment Name:")
                    .padding()

                TextField("Garment Name", text: $garmentName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .background(Color.white)
                    )

                Spacer()
            }
            .padding()
            .navigationTitle("ADD")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save") {
                if garmentCount < 10 {
                    let newGarment = Garment(name: garmentName, creationTime: Date())
                    modelContext.insert(newGarment)
                    try? modelContext.save()
                    isPresented = false
                } else {
                    showingLimitAlert = true
                }
            }
            .disabled(garmentName.isEmpty))
        }
        .alert("Garment Limit Reached", isPresented: $showingLimitAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("You can't add more than 10 garments.")
        }
    }
}

#Preview {
    let isPresented = Binding<Bool>.constant(true)
    return AddGarmentView(isPresented: isPresented, garmentCount: 5)
        .modelContainer(for: Garment.self, inMemory: true)
}
