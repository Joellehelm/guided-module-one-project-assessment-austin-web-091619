Module One Final Project: QUIZ SHOW!
====================================

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Examples of Use](#examples-of-use)
* [Credits](#credits)

---

## General info
This project, the capstone of MOD 1, is a Command Line Interface Trivia Game. The game allows you to:

- Create a username and password
- Select a topic of trivia to play, along with a level of difficulty
- See your past scores
- Delete your history

The user interacts with this fully through a Command Line Interface (e.g. Terminal in a Mac) by selecting guided options. The questions are sourced from the [Open Trivia Database API](https://opentdb.com/).

---

## Technologies

This application was written in Ruby. Thus, Ruby is required to be installed on your machine. The application also requires the following [Ruby Gems](https://rubygems.org/) to function:

- [rest-client](https://rubygems.org/gems/rest-client/versions/1.8.0): to communicate the the trivia API. 
- [json](https://rubygems.org/gems/json): To parse incoming data from the trivia API
- [text-table](https://rubygems.org/gems/text-table/versions/1.2.4): To make the results of your scores presentable in your terminal
- [rainbow](https://rubygems.org/gems/rainbow): To format the behaiviors (e.g. colors, flashing) of text of certain elements of the game in your terminal
- [bundler](https://rubygems.org/gems/bundler): To help manage dependencies

Further Ruby Gems were used in the development of the application:

- [pry](https://rubygems.org/gems/pry): To help understand what's going on in the application
- [activerecord](https://rubygems.org/gems/activerecord): For the associations of the classes in the backend
- [sqlite3](https://rubygems.org/gems/sqlite3): To build and manage the database



## Examples of Use

This is what the application looks like when its up and running:


   ![](/images/quiz_game.gif)


## Setup

To get the application up and running on your machine, follow these steps:

1. Make sure you have Ruby installed by opening your terminal and typing, 

   ```ruby -v ```

You should get something like this 

   ```ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-darwin18] ```
   
2. Download this repository

3. Open up your terminal. In your terminal, cd into the repository you just downloaded like so, 

   ``` cd your/path ```
   
   in my computer, that would look like this:
   
   ``` cd /Users/saul/documents/Learning/flatiron/projects/p1/guided-module-one-project-assessment-austin-web-091619 ```

5. run this command: 

   ``` bundle install ```
   
6. Then: 

   ``` ruby bin/run.rb ```

5. Follow the in prompt commands of the game, and



6. Have fun! 😀


## Credits


The humble developers in training that built this are:


**Joelle Helm** [LinkedIn](https://www.linkedin.com/in/joellehelm/) // [Github](https://github.com/Joellehelm)

&

**Saul Feliz** [LinkedIn](https://www.linkedin.com/in/saul-feliz-ba8bab1/) // [Github](https://github.com/saulhappy)
