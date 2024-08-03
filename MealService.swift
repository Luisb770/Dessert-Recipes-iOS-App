import Foundation

// Service class responsible for fetching meal data from TheMealDB API
class MealService {
    // URL for fetching the list of dessert meals
    private let dessertURL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    
    // Fetch the list of desserts asynchronously
    func fetchDesserts() async throws -> [Meal] {
        // Perform network request
        let (data, _) = try await URLSession.shared.data(from: dessertURL)
        // Decode JSON response to a dictionary with a key "meals" mapping to an array of Meal objects
        let response = try JSONDecoder().decode([String: [Meal]].self, from: data)
        // Return the array of Meal objects, or an empty array if the key is not found
        return response["meals"] ?? []
    }
    
    // Fetch detailed information for a specific meal asynchronously
    func fetchMealDetail(mealID: String) async throws -> MealDetail {
        // URL for fetching meal details by ID
        let detailURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")!
        // Perform network request
        let (data, _) = try await URLSession.shared.data(from: detailURL)
        // Decode JSON response to a dictionary with a key "meals" mapping to an array of MealDetail objects
        let response = try JSONDecoder().decode([String: [MealDetail]].self, from: data)
        // Return the first MealDetail object in the array, or a default value if the array is empty
        return response["meals"]?.first ?? MealDetail(name: "", instructions: "", ingredients: [])
    }
}

