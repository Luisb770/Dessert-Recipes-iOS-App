import Foundation

// Model for a Meal, conforming to Identifiable and Codable protocols
struct Meal: Identifiable, Codable {
    let id: String       // Unique identifier for the meal
    let name: String     // Name of the meal
    
    // Custom coding keys to map JSON keys to struct properties
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
    }
}

// Model for detailed meal information, conforming to Codable protocol
struct MealDetail: Codable {
    let name: String     // Name of the meal
    let instructions: String    // Cooking instructions for the meal
    let ingredients: [String]   // List of ingredients for the meal
    
    // Custom coding keys to map JSON keys to struct properties
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case instructions = "strInstructions"
        case ingredients
    }
    
    // Custom initializer to handle null or empty values
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Unknown"
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions) ?? "No instructions available"
        
        // Decode ingredients and filter out empty values
        let ingredientsDict = try container.decodeIfPresent([String: String?].self, forKey: .ingredients) ?? [:]
        self.ingredients = ingredientsDict.compactMap { $0.value?.isEmpty == false ? $0.value : nil }
    }
}
