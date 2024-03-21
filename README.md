# Scratch Card

Scratch win Prize with us.


## Folder Structure
The project follows a structured folder architecture for better organization and separation of concerns:

- **`lib`**: Contains the main source code of the application.
  - **`core`**: Contains shared utilities, constants, and common functionality used across the application.
     - **`constants`**: here api base url cstring         constant , api key, token , stripe key , google key , etc
     - **`data`**: hard code data
     - **`extension`**:like on int , buildcontext etc.
     - **`utils`** here you will find the classes for the image_assets path, font , dimension,size etc
  - **`theme`**: it contain the app theme data.   
  - **`modal`** model class used by app
  - **`presentation`** all screens of app
       - **`name of screen`** the base forlder for the screen ui and shared components for that particular sccreen
            - screens
  - **`widgets`**: Here are the shared widget through out the app.          
- **`test`**: Includes unit tests and integration tests.
Feel free to modify the project structure according to your preferences and project requirements

## State Management
The Bloc (Business Logic Component) pattern is employed to manage the state of the application. It facilitates a clear separation between the UI code (View) and the business logic (Bloc), making the codebase more maintainable and testable.

Key Benefits:

Separation of Concerns: The Bloc pattern ensures a clear separation between UI code and business logic, enhancing maintainability and readability.
Testability: Business logic encapsulated within Blocs can be easily tested independently of the UI, leading to better test coverage and reliability.
Reusability: Blocs can be reused across different parts of the application or even in other projects, reducing redundancy and promoting code reuse.

## Flutter Bloc for State Management:
Flutter Bloc is a state management library that helps in handling the flow of data within the application. We are using it to manage the state transitions triggered by different events, such as authentication changes and mapping events.

Events: Represent user actions or system events that trigger a state change.
States: Represent the different states the application can be in based on the events.
Bloc: Manages the transition from one state to another in response to events.

## Dependencies
The project relies on several dependencies to achieve its functionalities:

- flutter_bloc: For state management.
- scratcher: for scratch card


## How to Run
To run the project locally, follow these steps:

## Clone this repository.
Checkout the desired branch (e.g., implementing-google-map).
Ensure you have Flutter installed and configured on your machine.
Run flutter pub get to install dependencies.
Run the app using flutter run.
