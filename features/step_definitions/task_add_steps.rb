Then(/^I should see the following fields to add a task "([^"]*)"$/) do |task_add_fields|
  @list_of_fields = task_add_fields.split(',')
  task_add_page.verify_if_we_have_all_the_fields(@list_of_fields)
end

Given(/^I am on the "([^"]*)" form$/) do |page_name|
  step 'I am on the "Tasks" page'
  step 'I click on "Add Task" button'
  await
  task_add_page.verify_if_i_am_on_the_page(page_name)
end

And(/^I add a task with "([^"]*)"$/) do |task_details|
  tasks_page.add_a_task(task_details)
end

When(/^I don't enter the task name$/) do
  task_add_page.task_name.click
end

And(/^I have entered the task name "([^"]*)"$/) do |task_name|
  # task_add_page.task_name.set task_name
  task_add_page.enter_task_name(task_name)
  sleep 2
end

When(/^I have entered characters in to the date field$/) do
  sleep 2
  task_add_page.set_due_date("some characters")
end

Then(/^I should see that the "([^"]*)" button should be "([^"]*)" for user interaction$/) do |button_name, button_status|
  case button_status
    when "disabled"
      expect(task_add_page.task_submit_button["disabled"]).to eq "true"
    when "enabled"
      expect(task_add_page.task_submit_button["disabled"]).to eq nil
  end
end

And(/^I have entered task details with "([^"]*)"$/) do |type_of_task_details|
  task_add_page.enter_the_required_task_details(type_of_task_details)
end

And(/^I have entered (\d+) task details with following tasks$/) do |number_of_tasks, table|
  @data = table.raw
  task_add_page.enter_the_required_task_details(number_of_tasks, @data)
end