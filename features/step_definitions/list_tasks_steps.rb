Given(/^I am on the "([^"]*)" page$/) do |page_name|
  case page_name
    when "Tasks"
      list_tasks_page.load
      await
      list_tasks_page.verify_if_i_am_on_page(page_name)
  end

end

Then(/^I should see the "([^"]*)" button$/) do |button_name|
  list_tasks_page.verify_if_we_have_list_page_buttons(button_name)
end

When(/^I click on "([^"]*)" button$/) do |button_name|
  list_tasks_page.click_on_buttons_on_task_list_page(button_name)
end

Then(/^I should see the task is created successfully with task names:$/) do |table|
  list_of_tasks = table.raw
  list_tasks_page.verify_if_task_is_created_successfully(list_of_tasks)
end

Then(/^I should be on the task detail page with following data "([^"]*)" with done status set to "([^"]*)"$/) do |task_details_for_verification, done_status|
  tasks_details_page.verify_the_task_details_are_created_as_entered(task_details_for_verification, done_status)
end

When(/^I mark the task status as done$/) do
  step 'I click on "Mark as done" button'
end

Then(/^I should see that the task "([^"]*)" is successfully deleted$/) do |task_details|
  list_tasks_page.verify_if_task_is_deleted_successfully(task_details)
end


When(/^I click on "([^"]*)" button on "([^"]*)" task$/) do |button_name, task_name|
  list_tasks_page.click_on_button_for_a_task(button_name, task_name)
end

And(/^I click on "([^"]*)" button to be on the task details page for task "([^"]*)"$/) do |button_name, task_name|
  list_tasks_page.click_on_button_for_a_task(button_name, task_name)

end