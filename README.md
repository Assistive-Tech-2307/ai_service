# README

## Table of Contents
- [About this App](#about-this-app)
- [Ruby Version](#ruby-version)
- [System dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Tests](#tests)
- [Services](#services)
- [OpenAi API Key](#get-your-own-openai-api-key-here-httpsopenaicom)
- [Endpoints](#endpoints)
   - [POST Endpoints](#post-endpoints)
      - [AI Request](#apiv1ai_requests)
- [Contributors](#contributors)

## About this App

This application is built as a microservice to handle communications with OpenAi specifically in the search for assistive technologies. A FE app or other service can call the endpoints to get data on technologies that can assist individuals with different kinds of disabilities. Data is formatted for ease of use by breaking each technology down into a different object with attributes describing the tech. 

## Ruby version <br>
ruby 3.2.2

## System dependencies
- Dependencies are contained in Gemfile, run `bundle` after cloning repo to install all dependencies

## Configuration
- After cloning repo to your own directory run commands in terminal:
- `bundle install`
- `rails db:create`
- To run the server in development env:
- `rails s`

## Tests
- to run the test run in terminal:
- `bundle exec rspec`

## Services
- Uses OpenAi as a chat service to get back dynamic responses on technologies, can easily be swapped out for another Ai chat services by modifying the base endpoint contained in services/ai_service.rb
#### Get your own OpenAi api key here https://openai.com/
- create an account or log-in, then request a new api_key through their dashboard
- Hide your new key by typing `EDITOR="code --wait" rails credentials:edit`
- when the file opens save your new key as<br>
`open_ai:`<br>
&nbsp; `key: "Your key here"`

## Endpoints
### POST Endpoints
#### "/api/v1/ai_requests" <br>
example request: <br> ![Picture of example request.](example_request.png)<br>
- pass params in the body of the request
- required params {"tech_needs":[], "disability_description": []}
- even if only 1 parameter is submitted the value for each key must be an Array
- returns assistive technologies that the AI finds for the given tech needs and disability description <br>
example response: <br> ![Picture of response.](example_response.png) <br>

## Contributors
- Nick Spencer <a href="https://github.com/deadbert">@github.com/deadbert</a>
- Joop Stark <a href="https://github.com/JoopStark">@github.com/JoopStart</a>
- Eliza Keating <a href="https://github.com/elizakeating">@github.com/elizakeating</a>
