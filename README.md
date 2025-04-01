# Youth Sports Management Platform

A comprehensive platform for managing youth sports organizations, teams, and events. Built with Ruby on Rails and Turbo.

## Features

- **Multi-role User System**
  - Admin: Full system management
  - Director: Organization management
  - Facility Admin: Facility and event management
  - Coach: Team and player management
  - Parent: Player registration and team viewing

- **Organization Management**
  - Create and manage multiple organizations
  - Set up facilities and venues
  - Manage teams and rosters
  - Track events and schedules

- **Team Management**
  - Create and manage teams
  - Handle player registrations
  - Track team statistics
  - Manage team rosters

- **Event Management**
  - Schedule games and practices
  - Manage facilities and venues
  - Track attendance
  - Handle event registrations

## Tech Stack

- Ruby on Rails 7.2
- Turbo and Stimulus
- Tailwind CSS
- PostgreSQL
- Devise for authentication

## Getting Started

### Prerequisites

- Ruby 3.2.2 or higher
- PostgreSQL
- Node.js and Yarn
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/MonsoudZ/Youth-Sports-Mangement.git
cd Youth-Sports-Mangement
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Set up the database:
```bash
rails db:create db:migrate
```

4. Start the server:
```bash
./bin/dev
```

5. Visit http://localhost:3000

## Development

- Run tests: `rails test`
- Run linter: `bundle exec rubocop`
- Run security checks: `bundle exec brakeman`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository or contact the development team.
