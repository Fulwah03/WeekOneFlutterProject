# Around Saudi 🇸🇦

Around Saudi is a Flutter tourism application that introduces users to some of the most beautiful destinations in Saudi Arabia.

The application is designed with a travel passport and ticket theme. Users can explore different destinations, view their details, discover recommended experiences, and open each location directly in Google Maps.

---

## 💡 Project Story

Around Saudi is a continuation of a tourism project I first created four years ago during a C++ bootcamp at Tuwaiq Academy.

The original version was a simple console-based program without a user interface. In this Flutter version, I revisited the same idea and transformed it into an interactive mobile experience with a new visual identity inspired by Saudi tourism, travel passports, tickets, and stamps.

This project represents my progress from writing basic console logic to designing and building an interactive mobile application.

---

## ✨ Features

* Displays four Saudi tourist destinations.
* Unique travel ticket design for every destination.
* Responsive interface using `MediaQuery`.
* Scrollable destinations using `ListView.builder`.
* Detailed travel passport screen.
* JSON-formatted destination data.
* Converts JSON data into model objects using `fromJson`.
* Dynamic destination display using `List<AroundSaudiModel>`.
* Navigation between screens using `Navigator`.
* Passes the selected model object to the Details Screen.
* Direct connection to Google Maps.
* Custom fonts and Saudi-inspired color palette.
* Destination search field interface.

---

## 📍 Destinations

* AlUla
* Farasan Islands
* Rijal Almaa
* Edge of the World

---

## 📱 Application Screens

### Home Screen

The Home Screen displays the application header and a collection of travel tickets. Each ticket contains the destination name, location, category, image, description, and an Explore button.

The destinations are generated dynamically from a list of `AroundSaudiModel` objects and displayed using `ListView.builder`.

<img width="862" height="1150" alt="Around Saudi Home Screen" src="https://github.com/user-attachments/assets/72ced331-421e-47e2-9d85-65f7c0e053b3" />

### Tourist Destinations

The destination data is stored in JSON format inside a separate data file. Each JSON object is converted into an `AroundSaudiModel` object using the `fromJson` factory constructor.

The converted model objects are stored in a list and displayed dynamically as travel tickets.

<img width="860" height="1148" alt="Around Saudi Tourist Destinations" src="https://github.com/user-attachments/assets/8e8af206-5f55-469e-a0fe-ea5058ce31dc" />

### Destination Details

When the user taps the Explore button, the selected `AroundSaudiModel` object is passed to the Details Screen using `Navigator` and `MaterialPageRoute`.

<img width="864" height="1154" alt="Around Saudi Destination Details" src="https://github.com/user-attachments/assets/b48ee3f7-5ce6-4adf-91b3-4e30b9ff8d37" />

### Travel Passport Information

The Details Screen presents the selected destination as a travel passport page, including its category, best visiting time, description, recommended experience, and a custom travel stamp.

<img width="858" height="1154" alt="Around Saudi Travel Passport Information" src="https://github.com/user-attachments/assets/4a3635b5-5c69-4a79-a27e-1fc945a95bd5" />

---

## 🧱 Data and Model Structure

The destination data is stored as a `List<Map<String, dynamic>>` inside `around_saudi_data.dart`.

The `AroundSaudiModel.fromJson` factory constructor converts each JSON object into an `AroundSaudiModel` object.

The Home Screen uses `getData()` inside `initState()` to convert the data and add the model objects to `placesList`.

The data flow is:

```text
aroundSaudiData
       ↓
AroundSaudiModel.fromJson()
       ↓
List<AroundSaudiModel>
       ↓
ListView.builder
       ↓
DetailsScreen
```

---

## 🗺️ Google Maps Integration

Users can tap the location icon or location name from either the Home Screen or the Details Screen to open the selected destination directly in Google Maps.

This feature is implemented using the `url_launcher` package.

---

## 🧩 Flutter Widgets and Concepts Used

The project includes:

* `Scaffold`
* `AppBar`
* `ListView`
* `ListView.builder`
* `Column`
* `Row`
* `Container`
* `SizedBox`
* `Image`
* `Text`
* `TextField`
* `ElevatedButton`
* `InkWell`
* `MediaQuery`
* `Navigator`
* `MaterialPageRoute`
* `Stack`
* `Positioned`
* `Expanded`
* `Transform`
* `StatefulWidget`
* `initState`
* Factory constructor
* JSON data
* Models

---

## 📦 Packages Used

* `google_fonts`
* `url_launcher`

---

## 📂 Project Structure

```text
lib/
├── data/
│   └── around_saudi_data.dart
├── models/
│   └── around_saudi_model.dart
├── screens/
│   ├── home_screen.dart
│   └── details_screen.dart
└── main.dart

assets/
└── images/
```

---

## 🔄 Project Refactoring

The original project stored the destination data directly inside the Home Screen using a list of maps.

The project was refactored to improve its structure by:

* Moving the destination data to a separate data file.
* Storing the data in JSON format.
* Creating an `AroundSaudiModel` class.
* Adding a `fromJson` factory constructor.
* Converting the Home Screen into a `StatefulWidget`.
* Loading the model objects using `getData()` and `initState()`.
* Displaying the destinations using `ListView.builder`.
* Passing an `AroundSaudiModel` object to the Details Screen.

---

## 👩🏻‍💻 Developed By

Developed as part of the Flutter Bootcamp at Tuwaiq Academy.






