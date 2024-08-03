import SwiftUI

// View displaying the details of a selected meal
struct MealDetailView: View {
    let mealID: String   // ID of the selected meal
    @StateObject private var viewModel = MealViewModel()   // ViewModel instance for managing state
    
    var body: some View {
        VStack {
            if let meal = viewModel.selectedMeal {   // Check if meal details are available
                Text(meal.name)
                    .font(.largeTitle)
                    .padding()
                Text(meal.instructions)
                    .padding()
                List(meal.ingredients, id: \.self) { ingredient in   // Display list of ingredients
                    Text(ingredient)
                }
            } else {
                ProgressView()   // Show a progress indicator while loading
                    .task {
                        await viewModel.loadMealDetail(mealID: mealID)   // Load meal details when the view appears
                    }
            }
        }
        .navigationTitle("Meal Details")   // Set the navigation bar title
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: .constant(viewModel.selectedMeal == nil)) {
            Alert(title: Text("Error"), message: Text("Failed to load meal details."), dismissButton: .default(Text("OK")))
        }
    }
}
