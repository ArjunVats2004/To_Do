# To-Do App

A Flutter application for managing to-do tasks.

## Prerequisites & Flutter Version

- **Flutter SDK**: `^3.41.1` (or compatible 3.x stable channel)
- **Dart SDK**: `^3.11.0`

---

## Setup & Installation Instructions

Follow these steps to set up and run the project locally:

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd To_Do
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify setup:**
   ```bash
   flutter doctor
   ```

4. **Run the app:**
   - Connect an emulator or physical device, or run on Desktop/Web:
     ```bash
     flutter run
     ```
   - Target a specific platform (e.g., Chrome or Windows):
     ```bash
     flutter run -d chrome
     flutter run -d windows
     ```

5. **Run tests:**
   ```bash
   flutter test
   ```

---

## Flutter Questions & Answers

### 1. What is the difference between StatelessWidget and StatefulWidget?
- **StatelessWidget**: Does not have mutable state and remains unchanged after it is built.
- **StatefulWidget**: Can maintain and update its state during its lifecycle.

### 2. What is `setState()` used for in Flutter?
`setState()` is used to notify Flutter that the state of a StatefulWidget has changed. It triggers the widget to rebuild.
### 3. What is the difference between ListView and Column?
- **Column**: Displays widgets vertically and does not provide scrolling by default.
- **ListView**: Also displays widgets vertically but supports scrolling and is better for long and dynamic lists.

### 4. How would you handle an API call in Flutter?
- I would use packages like `Dio` or `http` to make API requests and handle responses.
- I would manage loading, success, and error states using state management such as Riverpod, Bloc, or GetX.

### 5. What is the purpose of `pubspec.yaml`?
`pubspec.yaml` contains the project's configuration, dependencies, assets, fonts. It is also used to manage packages required by the application.

### 6. Which Flutter project or feature have you worked on that you are most proud of, and what was your contribution?
- **Project**: I am most proud of the Flutter application I worked on during my internship, which is currently used by the company's customers.
              I contributed to developing the UI, integrating APIs, implementing features, fixing bugs, and improving the overall user experience..
- **Contribution**: Contributed to the UI, API integration, authentication flow, and handling phone/SMS-related functionality.
