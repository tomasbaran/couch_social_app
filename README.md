# Couch Social App

A Flutter social media application built with clean architecture principles.



https://github.com/user-attachments/assets/ce5f8c0c-c88f-439a-8597-79e80d75435c



## Architecture

This app follows **Clean Architecture** with feature-based organization:

```
lib/
├── core/                    # Shared utilities and data
│   ├── data/               # Fake data for development
│   └── utils/              # Result wrapper for error handling
└── features/               # Feature modules
    ├── wall/               # Social wall feature
    │   ├── data/           # Repository implementations
    │   ├── domain/         # Business logic
    │   │   ├── entities/   # AppPost entity
    │   │   └── repo_contracts/ # Repository interfaces
    │   └── presentation/   # UI layer (screens, view models)
    └── profile/            # User profile feature
        ├── data/           # Repository implementations  
        ├── domain/         # Business logic
        │   ├── entities/   # AppUser entity
        │   └── repo_contracts/ # Repository interfaces
        └── presentation/   # UI layer (screens, view models)
```

## Tech Stack

- **Flutter** with Material Design
- **Provider** for state management
- **Clean Architecture** with domain-driven design
- **Repository pattern** for data access
- **Result wrapper** for error handling

## Features

- **Wall**: Social feed with posts and friends
- **Profile**: User profile management with 50% error simulation for testing
- **State Management**: Provider pattern with ViewModels
- **Error Handling**: Result wrapper with retry functionality

## What I'd do differently in real life

- **Freezed for data objects**: Use [Freezed](https://pub.dev/packages/freezed) for entities and Result wrapper to get immutable classes with built-in equality, copyWith, and pattern matching
- **Command pattern for state management**: Replace simple loading/error flags with the more robust [Command pattern](https://github.com/tomasbaran/flutter-dark-mode-clean-architecture) using `CommandState<T>` (Idle, Executing, Succeeded, Failed) for better async operation handling and state tracking
- **Centralized dependency injection**: Use a centralized DI container like [AppDependencies](https://github.com/tomasbaran/flutter-dark-mode-clean-architecture/blob/main/lib/core/app_dependencies.dart) instead of creating dependencies inline in widgets
- **Comprehensive testing**: Add unit tests, widget tests, integration tests, and golden tests for complete test coverage

## Challenges/Future todos

- **Data loading strategy**: The current design first loads posts and then updates them with author information (L23-24 in wall_screen.dart). This approach should be reviewed to determine if it's optimal for the project requirements.
