# Deploying a Rails 7 + React app to AWS via Dokku (Base App)

If you're cloning the app, just clone and [create a new master key](https://stackoverflow.com/a/59993704/17113811).

## Steps to setting up the app on your own, from scratch

#### Prerequisites

- ruby and a version manager (I use [asdf](https://github.com/asdf-vm/asdf))
- [rails](https://edgeguides.rubyonrails.org/getting_started.html)
- [nvm/node](https://github.com/nvm-sh/nvm)
- [postgres](https://www.postgresql.org/download/)

#### Step-by-step setup

create new rails api project with postgres as db

```bash
rails new ror-react-dokku --api --database=postgresql && cd ror-react-dokku
```

Within `Gemfile`, uncomment `rack-cors` and `jbuilder`. add `faker`

install packages

```bash
bundle install
```

uncomment cors and allow all origins (see `config/initializers/cors.rb`)

> This isn't secure, so make sure you configure sources properly if you're following this guide for your production-ready app

create migration for employees (see `db/migrate/20241008043155_create_employees.rb`)

create model for employees (see `app/models/employee.rb`)

write `db/seeds.rb`

create database and seed

```bash
rails db:create
rails db:migrate
rails db:seed:replant --trace
```

write controllers

- `app/controllers/arbitrary_controller.rb`
- `app/controllers/employees_controller.rb`
- `app/controllers/static_controller.rb`

create routes for the above (see `config/routes.rb`)

create frontend

```bash
npm create vite@latest frontend -- --template react-ts
cd frontend && npm install
npm install axios

# remove unnecessary files
cd src && rm -rf assets/ App.css index.css && cd ..
```

change frontend App content (see `frontend/src/App.tsx`)

remove `index.css` import from `frontend/src/main.tsx`

change `frontend/package.json` script for `build` and `frontend/vite.config.ts`

delete `public/` from rails folder and add it to `.gitignore`

create `app.json` and `package.json` (in rails folder) for dokku