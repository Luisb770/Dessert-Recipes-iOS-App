

# Dessert Recipes iOS App

## Overview

The Dessert Recipes app is a native iOS application that allows users to browse and view detailed recipes for desserts. The app utilizes TheMealDB API to fetch and display a list of dessert meals, sorted alphabetically. When a user selects a meal, the app navigates to a detail view that includes the meal's name, instructions, and ingredients. This project is built using Swift and SwiftUI, with all asynchronous code written using Swift Concurrency (async/await).

## Features

- **Fetch List of Dessert Meals:** Retrieves a list of dessert meals from TheMealDB API.
- **Display Meals Alphabetically:** Shows the list of meals in alphabetical order.
- **Meal Detail View:** Provides detailed information for each selected meal, including name, instructions, and ingredients.
- **Swift Concurrency:** Utilizes async/await for asynchronous operations.
- **Error Handling:** Implements basic error handling and filtering of null or empty values to enhance user experience.
- **User-Friendly UI:** Designed using SwiftUI for a clean and intuitive user interface.

## Requirements

- **Xcode:** Latest version required for building and running the project.
- **Swift Version:** Swift 5.5 or later.
- **iOS Version:** iOS 14.0 or later.

## Installation

1. **Clone the Repository:**
   - Use the command `git clone https://github.com/yourusername/DessertRecipes.git` to clone the repository.
   - Navigate to the project directory with `cd DessertRecipes`.

2. **Open the Project:**
   - Open `DessertRecipes.xcodeproj` in Xcode.

3. **Build and Run:**
   - Build and run the project on the simulator or a physical device.

## Project Structure

- **Models:**
  - Defines the data models for `Meal` and `MealDetail` to represent the JSON data structure.

- **Services:**
  - Contains the network layer to handle API requests and responses from TheMealDB API.

- **ViewModels:**
  - Manages the state and business logic of the app, including fetching and processing data.

- **Views:**
  - `ContentView` displays the list of dessert meals.
  - `MealDetailView` shows detailed information for the selected meal.

## API Endpoints

- **Fetch List of Dessert Meals:**
  - URL: `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`
  - Response: JSON array of meals.

- **Fetch Meal Details by ID:**
  - URL: `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID`
  - Response: JSON object with detailed meal information.

## Detailed Explanation

### Models
- **Meal:**
  - Represents a dessert meal with properties for meal ID and name.
  - Conforms to `Identifiable` and `Codable` protocols for easy identification and JSON decoding.
  
- **MealDetail:**
  - Represents detailed information about a meal, including name, instructions, and ingredients.
  - Conforms to `Codable` protocol for JSON decoding.
  - Custom initializer to handle null or empty values and filter ingredients.

### Services
- **MealService:**
  - Handles network requests to fetch data from TheMealDB API.
  - Contains methods for fetching a list of desserts and detailed meal information.
  - Uses async/await for asynchronous operations to ensure non-blocking code execution.

### ViewModels
- **MealViewModel:**
  - Manages the state of the app, including the list of meals and details of the selected meal.
  - Fetches data using `MealService` and updates the published properties to reflect changes in the UI.
  - Implements error handling to manage any issues during data fetching.

### Views
- **ContentView:**
  - Displays a list of dessert meals fetched from the API.
  - Utilizes a navigation link to navigate to `MealDetailView` upon selecting a meal.
  - Includes error handling to show alerts if data fetching fails.

- **MealDetailView:**
  - Shows detailed information about the selected meal, including name, instructions, and ingredients.
  - Displays a progress indicator while data is being fetched.
  - Includes error handling to show alerts if data fetching fails.

## Error Handling

The app includes basic error handling to display alerts if the data fetching fails. This ensures a better user experience by informing users of any issues.

