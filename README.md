# Notes App

A Flutter application for managing notes with a JSON server backend.

## Getting Started

This project consists of two parts:
1. A Flutter mobile/web application
2. A JSON server for data persistence

### Prerequisites

- Flutter SDK installed
- Node.js and npm installed

### Running the JSON Server

Before running the Flutter app, you need to start the JSON server:

1. Navigate to the JSON server directory:
   ```bash
   cd my-json-server
   ```

2. Install dependencies (if not already installed):
   ```bash
   npm install
   ```

3. Start the JSON server:
   ```bash
   npx json-server db.json --port 3000
   ```

The JSON server will run on `http://localhost:3000` and provide endpoints for your notes data.

### Running the Flutter App

1. Make sure you're in the root directory of the project
2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/` - Flutter application source code
  - `main.dart` - App entry point with BLoC provider setup
  - `bloc/` - Business logic components
  - `screens/` - UI screens
- `my-json-server/` - JSON server setup
  - `db.json` - Database file for notes
  - `package.json` - Node.js dependencies

## API Endpoints

With the JSON server running, you can access:
- `GET /notes` - Get all notes
- `POST /notes` - Create a new note
- `PUT /notes/:id` - Update a note
- `DELETE /notes/:id` - Delete a note

## Flutter Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
