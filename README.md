# Nasa API SOM

Service Object Model created for all three of the services in the NeoWs (Near Earth Object Web Service) RESTful web service <br>
Nasa API - https://api.nasa.gov/api.html#NeoWS

## Objetive

Create tests with RSpec using Ruby. The tests efficiently check if the api is returning the correct form of data.

## About the API

NeoWs (Near Earth Object Web Service) is a RESTful web service for near earth Asteroid information. With NeoWs a user can: search for Asteroids based on their closest approach date to Earth, lookup a specific Asteroid with its NASA JPL small body id, as well as browse the overall data-set.
Data-set: All the data is from the NASA JPL Asteroid team (http://neo.jpl.nasa.gov/).

**Neo - Feed**:
Retrieve a list of Asteroids based on their closest approach date to Earth.

**Neo - Lookup**:
Lookup a specific Asteroid based on its NASA JPL small body (SPK-ID) ID

**Neo - Browse**:
Browse the overall Asteroid data-set

## How to run the tests

1. Clone this repo to your local computer
2. In your terminal, navigate to 'sparta_nasa_api_som'
3. Run 'rspec' command
4. You should get 60 examples, 0 failures
