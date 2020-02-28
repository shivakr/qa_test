Feature: Tasks feature
  As a User I should be able to add, manage and delete tasks on a webpage
  So that I have a webpage to monitor the tasks and update them as needed


  Scenario: Check for the View and Add task buttons
    Given I am on the "Tasks" page
    Then I should see the "Add Task" button
    Then I should see the "View Tasks" button

  Scenario: Add Task - form presence
    Given I am on the "Tasks" page
    When I click on "Add Task" button
    Then I should see the following fields to add a task "Name,Description,Priority,Due_Date"

  Scenario: Add Task form validation - No task name entered
    Given I am on the "Add new task" form
    When I don't enter the task name
    Then I should see that the "Submit" button should be "disabled" for user interaction

  Scenario: Add Task form validation - with task name entered and date field has characters
    Given I am on the "Add new task" form
    When I have entered the task name "Some Test Task Name"
    Then I should see that the "Submit" button should be "enabled" for user interaction
    When I have entered characters in to the date field
    Then I should see that the "Submit" button should be "disabled" for user interaction

  Scenario: Add Task form validation - with task name entered
    Given I am on the "Add new task" form
    When I have entered the task name "Some Test Task Name"
    Then I should see that the "Submit" button should be "enabled" for user interaction

  Scenario: Add Task - successful addition of task with task name only
    Given I am on the "Add new task" form
    And I have entered 1 task details with following tasks
      |CORRECT_TASK_DETAILS|
    Then I should see the task is created successfully with task names:
      |CORRECT_TASK_DETAILS|
    Then I should see the "View" button
    Then I should see the "Mark as Done" button

  Scenario: View added task - Add Task all details filled
    Given I am on the "Add new task" form
    And I have entered 1 task details with following tasks
      |CORRECT_TASK_DETAILS|
    Then I should see the task is created successfully with task names:
      |CORRECT_TASK_DETAILS|
    When I click on "View" button
    Then I should be on the task detail page with following data "CORRECT_TASK_DETAILS" with done status set to "No"

  Scenario: View added task - Add Task without description
    Given I am on the "Add new task" form
    And I have entered 1 task details with following tasks
      |TASK_DETAILS_WITH_OUT_DESCRIPTION|
    Then I should see the task is created successfully with task names:
      |TASK_DETAILS_WITH_OUT_DESCRIPTION|
    When I click on "View" button
    Then I should be on the task detail page with following data "TASK_DETAILS_WITH_OUT_DESCRIPTION" with done status set to "No"

  Scenario: Add Task without description - Mark Task as Done
    Given I am on the "Add new task" form
    And I have entered 1 task details with following tasks
      |TASK_DETAILS_WITH_OUT_DESCRIPTION|
    And I click on "View Task" button
    And I mark the task status as done
    When I click on "View" button
    Then I should be on the task detail page with following data "TASK_DETAILS_WITH_OUT_DESCRIPTION" with done status set to "Yes"

  Scenario: Add Task with all details - Delete the added task
    Given I am on the "Add new task" form
    And I have entered 1 task details with following tasks
      |TASK_DETAILS_WITH_OUT_DESCRIPTION|
    And I click on "View" button to be on the task details page for task "TASK_DETAILS_WITH_OUT_DESCRIPTION"
    When I delete the added task on the task details page
    Then I should see that the task "TASK_DETAILS_WITH_OUT_DESCRIPTION" is successfully deleted

  Scenario: View added task - Add multiple tasks Task all details filled
    Given I am on the "Add new task" form
    And I have entered 3 task details with following tasks
      | CORRECT_TASK_DETAILS                    |
      | CORRECT_TASK_DETAILS_PRIORITY_HIGH      |
      | TASK_DETAILS_WITH_OUT_DESCRIPTION       |
    Then I should see the task is created successfully with task names:
      | CORRECT_TASK_DETAILS                    |
      | CORRECT_TASK_DETAILS_PRIORITY_HIGH      |
      | TASK_DETAILS_WITH_OUT_DESCRIPTION       |
    When I click on "View" button on "CORRECT_TASK_DETAILS" task
    Then I should be on the task detail page with following data "CORRECT_TASK_DETAILS" with done status set to "No"