import SwiftUI

// Main view displaying the list of desserts
struct ContentView: View {
    @StateObject private var viewModel = MealViewModel()   // ViewModel instance for managing state
    
    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in    // Display a list of meals
                NavigationLink(destination: MealDetailView(mealID: meal.id)) {   // Navigate to MealDetailView on tap
                    Text(meal.name)    // Display meal name
                }
            }
            .navigationTitle("Dessert Recipes")   // Set the navigation bar title
            .task {
                await viewModel.loadDesserts()    // Load desserts when the view appears
            }
        }
        .alert(isPresented: .constant(viewModel.meals.isEmpty)) {
            Alert(title: Text("Error"), message: Text("Failed to load desserts."), dismissButton: .default(Text("OK")))
        }
    }
}
