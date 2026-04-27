#  Flutter CRUD Operations using SQLite

A Flutter application that demonstrates **CRUD (Create, Read, Update, Delete)** operations using a local SQLite database. This project helps understand local data storage and database management in Flutter.

---

##  Features

*  Add new records (Create)
*  View all saved records (Read)
*  Update existing records (Update)
*  Delete records (Delete)
*  Local storage using SQLite database
*  Real-time UI updates

---

##  Technologies Used

* Flutter
* Dart
* SQLite (sqflite package)

---

##  Project Structure

```id="db11xy"
lib/
 └── main.dart
models/
 └── data_model.dart   (optional)
database/
 └── db_helper.dart    (SQLite helper class)
```

---

##  Getting Started

Follow these steps to run the project locally:

### Prerequisites

* Install Flutter SDK
* Install Android Studio / VS Code
* Set up an emulator or connect a physical device

---

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/flutter-crud-sqlite.git
   ```

2. Navigate to the project directory:

   ```bash
   cd flutter-crud-sqlite
   ```

3. Get dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

---

##  Dependency Setup

Add the following dependency in `pubspec.yaml`:

```yaml id="sqlite1x"
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.3
```

---

##  How It Works

* Uses **SQLite database** for local storage
* `sqflite` package handles database operations
* `CRUD operations` implemented as:

  * **Create** → Insert data into table
  * **Read** → Fetch data from table
  * **Update** → Modify existing data
  * **Delete** → Remove data from table
* UI updates dynamically using `setState()`

---

##  Future Improvements

* Add search functionality
* Improve UI with modern design
* Add form validation
* Implement pagination for large data
* Use Provider or Bloc for state management

---

##  Contributing

Contributions are welcome! Feel free to fork this repository and submit a pull request.

---

##  License

This project is open-source and available under the MIT License.

---

##  Author

Riya Patani

---
