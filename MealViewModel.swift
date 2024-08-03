import SwiftUI

// ViewModel class for managing the state and business logic of the app
@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []       // List of meals to be displayed in the UI
    @Published var selectedMeal: MealDetail? = nil    // Details of the selected meal
    
    private let mealService = MealService()    // Instance of MealService for fetching data
    
    // Load the list of desserts asynchronously
    func loadDesserts() async {
        do {
            // Fetch desserts and sort them alphabetically
            meals = try await mealService.fetchDesserts().sorted { $0.name < $0.name }
        } catch {
            // Handle any errors that occur during fetching
            print("Error fetching desserts: \(error)")
        }
    }
    
    // Load detailed information for a specific meal asynchronously
    func loadMealDetail(mealID: String) async {
        do {
            // Fetch meal details
            selectedMeal = try await mealService.fetchMealDetail(mealID: mealID)
        } catch {
            // Handle any errors that occur during fetching
            print("Error fetching meal details: \(error)")
        }
    }
}
