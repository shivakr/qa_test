module Pages
  class TaskDetailsPage < SitePrism::Page

    include RSpec::Matchers

  element :task_details_title, ".task-name"
  element :task_details_description, ".description"
  element :task_details_priority, ".priority"
  element :task_details_due_date, ".due-date"
  element :task_details_task_done_status, ".done"
  element :delete_task, ".delete-task"


  def verify_the_task_details_are_created_as_entered(task_details_for_verification, done_status)
    @data = Utils.get_task_details
    @task_data = @data[task_details_for_verification]
    sleep 2
    expect(task_details_title.text).to eq "#{@task_data['TASK_NAME']}"
    expect(task_details_description.text).to include "#{@task_data['DESCRIPTION']}"
    expect(task_details_priority.text).to eq "Priority: #{@task_data['PRIORITY']}"
    @due_date=Chronic.parse('tomorrow').strftime("%b %d, %C%C")
    expect(task_details_due_date.text).to eq "Due date: #{@due_date}"
    expect(task_details_task_done_status.text).to eq "Done: #{done_status}"
  end

  def delete_the_task
    delete_task.click
  end

  end

end
