# Lululemon App

The Lululemon App is designed to manage a collection of garments. It allows users to add, list, and sort garments either alphabetically or by creation time. This app leverages SwiftUI and SwiftData for an effective and efficient user experience.

![App UI](https://github.com/marlhex/Lululemon_SwiftData/assets/4165637/cdc94c1e-e218-473c-bf7b-9a8beed83ed9)

## Future video goes here

## Features

- **Add Garments**: Add new garment entries with a name and auto-generated creation timestamp.
- **Display Garments**: View a list of added garments.
- **Sort Garments**: Sort garments alphabetically or by creation time.
- **Delete All Garments**: Option to delete all garments at once.
- **Limit Enforcement**: Restricts the total number of garments to 10.
- **Empty State Handling**: Displays a message when the garment list is empty.
- **Responsive UI**: Animations and loaders provide visual feedback during data operations.

## Architecture

The app is built using the MVVM architecture pattern to ensure a clear separation of concerns and to facilitate easier maintenance and scalability.

### Components

- **Model**: Represents the data structure (Garment).
- **View**: UI components for user interaction (ContentView, AddGarmentView, ListSortView).
- **ViewModel**: Manages the data for the View (implicit in SwiftData's @Query and @Environment property wrappers).

### Technologies Used

- **SwiftUI**: For building the user interface.
- **SwiftData**: For data persistence and management.
- **Combine**: For reactive programming (implicit in SwiftUI's state management).

## Testing

The app includes both unit tests and UI tests to ensure reliability and correctness:

- **Unit Tests**: Test the core functionality of the data layer and business logic.
- **UI Tests**: Verify the user interface behaves correctly under various scenarios.

## Getting Started

To run this project:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on your chosen simulator or device.

## Future Improvements

- Implement edit functionality for existing garments.
- Add more detailed garment information (e.g., size, color, type).
- Implement search functionality.
- Add user authentication for personalized garment lists.
