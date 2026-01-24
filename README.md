# ➕ MathGame Demo App (SwiftUI)

**MathGame** is a demo iOS application built with **SwiftUI** that challenges users with **simple addition questions**.  
The app tracks user scores using **Core Data** and **Swift Data** in swiftdata branch and supports **creating, updating, and deleting** saved scores.

This project follows the **MVVM design pattern** and uses the modern **`@Observable` macro** for state management.

## Demo
<p align="center">
  <img src="./assets/MathGameDemo.gif" width="420" alt="MathGame Demo" />
</p>

---

## ✨ Features

- ➕ Interactive **addition-based math game**
- 🌍 Supports multiple languages:
  - English
  - French
  - Arabic
  - Italian
  - Portuguese
  - Spanish
  - Turkish
- 🧮 Generate random number addition questions
- 🏆 Save user scores using **Core Data** and **Swift Data**
- ✏️ Update existing scores
- 🗑️ Delete stored scores
- 📊 Display score history
- 🧱 MVVM architecture
- 👀 Modern state management using **Observable macro**
- ⚡ Smooth SwiftUI experience

---

## 🧰 Tech Stack

| Category | Technology |
|--------|------------|
| **Language** | Swift |
| **UI Framework** | SwiftUI |
| **Architecture** | MVVM |
| **State Management** | `@Observable` |
| **Persistence** | Core Data & Swift Data
| **Platform** | iOS |
| **IDE** | Xcode |
| **Minimum iOS** | iOS 17+ |

---


## 📌 Project Overview

MathGame is designed as a **learning and demonstration project** that shows how to:
- Build a SwiftUI app using MVVM
- Implement a simple **addition game**
- Persist scores using Core Data and Swift Data
- Perform full **CRUD operations**
- Manage state with the modern `@Observable` macro

---

## 🧱 Architecture

The project follows the **MVVM (Model–View–ViewModel)** pattern:

- **View**: SwiftUI UI layer
- **ViewModel**: Game logic, score calculation, persistence
- **Model**: Core Data and Swift Data entities for saved scores

The **Observable macro** replaces older patterns such as `ObservableObject` and `@Published`.

---

## 💾 Core Data and Swift Data Usage

Core Data and Swift Data are used to:

- Store user scores locally
- Fetch score history
- Update saved scores
- Delete scores

All operations are handled through the ViewModel layer.

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone "https://github.com/HamedKharazmi1990/MathGame-CoreData"
cd "Math Game"
```

### 2️⃣ Open the Project

    1. Open Math Game.xcodeproj in Xcode
    2. Select an iPhone simulator
    4. Press Run (⌘R) 


### ⚠️ Limitations

    - Only addition questions
    - Demo-level difficulty
    - No remote sync or cloud storage
    - Basic UI styling
    

## 🔀 SwiftData Migration (New Branch)

A new branch has been created to migrate persistence from **Core Data** to **SwiftData**.

### 📌 Details

- A separate branch introduces **SwiftData** as a modern replacement for Core Data
- Uses Apple’s latest persistence framework introduced in iOS 17
- Simplifies data modeling and CRUD operations
- Integrates seamlessly with **SwiftUI** and the `@Observable` macro

### 🌿 swiftdata


### 🆚 Comparison

| Core Data | SwiftData |
|----------|-----------|
| Manual context management | Automatic data handling |
| More boilerplate | Cleaner & simpler syntax |
| Older persistence API | Modern Swift-native API |

> Both implementations are kept for comparison and learning purposes.


### 👨‍💻 Maintainer

    Hamed Kharazmi
    📧 hamed.kharazmi@gmail.com


    

