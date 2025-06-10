# 💬 The Gossip Project - Rails Web Application 🌟

## 📖 Description

🚀 Welcome to The Gossip Project! Our first comprehensive Rails web application featuring a complete MVC architecture with stunning Bootstrap styling. This social network allows users to browse gossips, discover authors, and navigate through beautiful, responsive pages. Built as a foundation for advanced Rails features coming in the following days! 🤭

### 🏆 Team Collaboration @Melody-ste && @Paarroo 🤝

- **Pair Programming Sessions**: Enhanced code quality through real-time collaboration
- **Git Workflow Mastery**: Successfully managed branches, merges, and conflicts
- **Rails Learning Journey**: Navigated MVC architecture together
- **Bootstrap Integration**: Created stunning responsive design as a team
- **Problem Resolution**: Tackled PostgreSQL, routing, and controller challenges together

_"Great gossips bring people together, but great teamwork makes exceptional projects possible!"_ ✨

For questions about this project or to share your own gossips, visit our contact page at `/contact`!

💬 _"In the world of gossips, good stories spread fast - but great code lasts forever!"_ 🌟

## 🛠️ Prerequisites

- Ruby (version 3.0 or higher)
- Rails (version 8.0 or higher)
- PostgreSQL or SQLite3
- Bundler gem
- Bootstrap 5.3.3 (via CDN)
- Terminal/Command line interface

## 📦 Installation

1. Clone the repository on your local machine
2. Navigate to the project directory
3. Install dependencies:

```bash
bundle install
```

4. Create and setup the database:

```bash
rails db:create
rails db:migrate
```

5. Seed the database with sample data:

```bash
rails db:seed
```

6. Start the development server:

```bash
rails server
```
7. See the result :

use http://localhost:3000/

## 🔄 Database Relationships

<pre>

  City ─┬─→ User ─┬─→ Gossip ─┬─→ Comment ─┐
        │         │           │            ├─→ Like (polymorphic)
        │         │           └─→ GossipTag┤
        │         │                        │
        │         ├─→ Comment ─────────────┘
        │         │
        │         ├─→ Like ─────────────────┐
        │         │                        │
        │         └─→ PrivateMessage ←─────┤
        │             (sender/recipients)   │
        │                                  │
        └─→ Tag ─────→ GossipTag ──────────┘

</pre>

```


** Built with ❤️, Rails, Bootstrap, and exceptional teamwork! **
```
