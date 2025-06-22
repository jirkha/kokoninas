# Kokoninas - The Idea Mill

[![Build Status](https://img.shields.io/badge/build-passing-green)](https://github.com)
[![Code Coverage](https://img.shields.io/badge/coverage-N/A-lightgrey)](https://github.com)
[![Ruby Version](https://img.shields.io/badge/ruby-3.4.4-red)](https://www.ruby-lang.org)

A simple web application built with Ruby on Rails to share, and rate ideas within a team.

## The Story Behind "Kokoninas"

Every team has great ideas and less great ideas. In the team culture of TIMEPRESS company, there is a special word for a "special" idea: **"kokonina"**. But sometimes the silliest "kokonina" can show a spark of genius.

This application was built to give every "kokonina" a chance. It's a simple place where team members can share any idea, without fear of judgment. Other members can then vote on them, helping to find the brilliant ideas among the silly ones.

### Core Features

* **User Profiles:** Create a simple user profile (for this version, no password is required).
* **Post Ideas:** Share a new "Kokonina" with a title and a description.
* **View All Ideas:** See a list of all ideas, sorted by their score.
* **Vote on Ideas:** Give an idea an upvote (**"Spektotentokulární"** - a word for spectacular) or a downvote (**"Hloupatý"** - silly).

## Tech Stack

- **Backend:** Ruby on Rails (Active Record, Controllers)
- **Frontend:** ERB templates (Rails views)
- **Styling:** Tailwind CSS
> Note: If you encounter Tailwind build issues, make sure your stylesheet is named `application.tailwind.css` and not duplicated across folders. Update paths in `config/tailwind.config.js` if needed.
- **Interactivity:** Hotwire (Turbo)  
  Turbo updates parts of the page without a full reload.

## A Note on Simplicity

This is a simplified version of the application, built as a portfolio project for a job application. The main goal was to demonstrate basic Rails skills.

This project can be easily extended with more advanced features.

---

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need to have the following software installed:

- **Ruby** version `3.4.4`
- **Bundler** (`gem install bundler`)
- **PostgreSQL** (make sure the service is running)

> **Note:** You do not need Node.js or Yarn. All JavaScript and CSS assets are managed by Rails and the `tailwindcss-rails` gem.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/jirkha/kokonina](https://github.com/jirkha/kokonina)
    cd kokoninas
    ```

2.  **Install Ruby gems:**
    ```bash
    bundle install
    ```

### Database Configuration

The application uses **PostgreSQL** and expects credentials to be set via environment variables (loaded from `.env`).

#### Step 1: Set up your local environment

1. Copy the example environment file and edit your credentials:
   ```bash
   cp .env.example .env
   ```
2. Open `.env` and update the values to match your local PostgreSQL setup:
   ```env
   DATABASE_USERNAME=your_db_user
   DATABASE_PASSWORD=your_db_password
   DATABASE_HOST=localhost
   ```
> These variables are used by `config/database.yml` to connect to the database.

#### Step 2: Create and initialize the database

You can run this one command to set everything up:
```bash
rails db:setup
```

Or run each step manually:
```bash
rails db:create    # Creates the database
rails db:migrate   # Applies migrations
rails db:seed      # Populates with sample data
```

---

### Running the Application

To start the local development server, run:
```bash
rails s
```

## Future Improvements

Here are some features that could be added next:

- **Full User Authentication**  
  Implement a secure password system using `has_secure_password` or the [Devise](https://github.com/heartcombo/devise) gem.

- **User Roles**  
  Add different roles like `admin` and `member`, with different permissions and access levels.

- **Commenting System**  
  Allow users to discuss each idea in a comment thread under each post.

- **Categories & Tags**  
  Add a system to organize ideas by topics (e.g., *Marketing*, *Development*, *Office Life*).
