# README

This repository contains automated tests for the QA Test provided

## High Level Tech Stack
* **Ruby**: Scripting
* **Cucumber framework**: To run BDD Tests
* **Gherkin:** Given, When and Then in feature file.
* **RSpec:** Matchers where we use to assert the expectations
* **Capybara/Selenium/Siteprism:** To define elements, to find elements and interact to do the testing on the webpage


### Requirements
* Ruby version 2.2.0 or greater using RVM(Ruby version manager)
* ng serve command to be used to run the Angular server to get the server up and running(This can be included inr akefile as task and run, but for now i have not used rakefile)
* To run tests on firefox please download firefox driver from https://github.com/mozilla/geckodriver/releases and place it somewhere on your PATH
* To run tests on chrome please download chrome driver from http://chromedriver.storage.googleapis.com/index.html and place it somewhere on your PATH


### Installation
To get started we firstly need the bundler gem (http://bundler.io/):

```
gem install bundler
```

Install dependencies:

```
bundle install
```

## Running the tests

cucumber.yml - Has profiles created with chrome and firefox profile pointing to dev environment which means it runs on 
local machines

* chrome is the default browser set
* all profiles are pointing to dev(local) environment by default
* alternative we can use ci as ENV=ci, to runn tests on ci, but for now that option will return UNSUPPORTED ENVIRONMENT 
error as we dont have the CI setup


###Runs all tests by default on chrome

```
bundle exec cucumber
```

###Runs all tests on firefox 
*Here -p options says using which profile we need to run the tests
```
bundle exec cucumber -p firefox
```

###Runs all tests for a specific feature
```
bundle exec cucumber /<feature_folder>/<feature_file>
```

###Runs a specific test
```
bundle exec cucumber /<feature_folder>/<feature_file>:<line_number> ENV=<environment> BROWSER=<browser>
or
bundle exec cucumber --tags <tag_name> 
or
bundle exec cucumber -p firefox --tags <tag_name>
```
* Tags can be used above any scenario for example @test and use in above command to run that specific scenario

### Test Structure and other details:
###Features Directory:
  * Has .feature file where all the user behaviour is written by product team and the tester along with team enhances 
  and the same can be used as reference from developers and across the stakeholders to get to know the scenarios both 
  positive and negative scenarios in plain english language
  * step_definitions - here we have all the definitions for the steps written in feature file, where we trannslate the 
  english level langauge to ruby scripts and supported by the other entities in support directory
  * support directory - here we have all the supporting file to manage the framework
    * env.rb - helps us to set the environemnt with all the required libraries(gems)
    * hooks.rb - Here we can create After and Before hooks, where we can define anything to be done before starting the 
    tests and after the tests which can be at scennrio or feature level. Basically setup data and cleaning up
    * browser_config - Here we decide which browser to test based on the command line arguments
    * app_config - All data that needed to start the app, here we have just defined the url from which we will start the 
    app
    
### lib Directory:
  * Main folder is pages, where all the pages objects are defined. Meaning, we have all the elements related to one page
   is put into that page for each maintainance in future
  * Any actions we are doing on a particular page is defined as Methods(functions) in that page
  * we use Siteprism to manage the element and locator definition
  
### Test Data folder
  * This folder can have all the data related to the tasks that we can create
  * This folder has user-data.json which should be anyone adding the new tasks
  * Any non dev's can use this to manage all dat
  
### Utils Folder
  * Used to place all common and user defined libraries to support the automation
  
### Cucumber.yml 
  * Here we define all the profiles for different browsers
  * Entry point for the cucumber framework
  * I have defied 2 profile chrome and firefox with default browser as chrome
  
### Gemfile
  * All the required Lirbaries are listes as gems and can be installed using "bundle install" command
  
### report.html
  * Test execution report will be provided in html format
  * Any failed tests will have the line it failed and the reason it failed
  * For failed scenarios we will have the screenshots attached, so that we can be sure where it failed even before 
  looking into stack trace