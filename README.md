# Pokémon App

A simple Pokémon application that fetches and displays a list of Pokémon using the [PokéAPI](https://pokeapi.co/). This app utilizes Swift, SwiftUI, UIKit, and Combine, following the MVVM architecture pattern.

https://github.com/user-attachments/assets/8059045a-41a8-4fd3-a443-2f01a9403c12

## Features

- Fetches Pokémon data from the PokéAPI.
- Displays Pokémon names, URLs, and images in a table view.
- Navigates to a detail view for more information about the selected

 Pokémon.
- Built with programmatic UI and supports unit and UI testing.

## Tech Stack

- Swift 
- SwiftUI + UIKit
- Combine
- MVVM Architecture
- XCTest for Unit and UI Testing

## API Usage

The app fetches data from the PokéAPI. The following endpoint is used to retrieve Pokémon data:
- **Endpoint:** `https://pokeapi.co/api/v2/pokemon?limit=100`

## MVVM Architecture

The application follows the MVVM architecture:

- **Model:** Represents the data structure (e.g., `Pokemon`).
- **ViewModel:** Fetches data from the API, handles business logic, and provides data to the views.
- **View:** Displays the data and handles user interactions.

## Custom Cells

The app uses a custom table view cell to display each Pokémon's name, URL, and image. The cell is designed programmatically for better flexibility and customization.

## Navigation

Users can tap on a Pokémon in the list to navigate to a detail view that provides additional information about the selected Pokémon.

## Testing

The app includes both unit and UI tests to ensure functionality and performance. You can run the tests using the Xcode testing framework.

### To run tests:

1. Open the `Test Navigator` in Xcode.
2. Select the desired tests and click the run button.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
