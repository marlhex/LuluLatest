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
- **Responsive UI**: Provides visual feedback during data operations.

## Architecture

The app uses a straightforward SwiftUI structure with SwiftData for persistence, leveraging SwiftUI's declarative syntax and SwiftData's ease of use.

### Components

- **Model**: Represents the data structure (Garment).
- **Views**: UI components for user interaction (ContentView, AddGarmentView, ListSortView).
- **SwiftData**: Handles data persistence and querying.

### Technologies Used

- **SwiftUI**: For building the user interface.
- **SwiftData**: For data persistence and management.

## Testing

The app includes unit tests to ensure reliability and correctness:

- **Unit Tests**: Test the core functionality of the data layer and business logic.

## Getting Started

To run this project:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on your chosen simulator or device.

### Flow Diagram

```mermaid
graph TD
    A[Start App] --> B[ContentView]
    B --> C{Empty List?}
    C -->|Yes| D[Show Empty Message]
    C -->|No| E[Display Garment List]
    B --> F[Sort Garments]
    F --> E
    B --> G[Add Garment]
    G --> H[AddGarmentView]
    H --> I{Limit Reached?}
    I -->|Yes| J[Show Alert]
    I -->|No| K[Save New Garment]
    K --> B
    B --> L[Delete All]
    L --> M[Confirm Deletion]
    M -->|Confirmed| N[Delete Garments]
    N --> B
    
    
- The diagram shows:

1. The main ContentView and its interactions
2. The process of adding a new garment, including the limit check
3. The sorting functionality
4. The delete all function
5. The empty state handling
