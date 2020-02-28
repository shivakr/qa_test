module Pages
  class ListTasksPage < SitePrism::Page

    include RSpec::Matchers

    # If you want to be able to navigate to a page, you'll need to set its URL
    set_url "#{AppConfig.app.base_url}"

    element :view_tasks_button,'.view_tasks'
    element :add_task_button,'.add-task'
    element :task_title, "h2"
    element :view_button, ".view-task"
    # element :view_button, "//a[@class='view-task']"
    element :mark_as_done_button, ".toggle-task-done"
    element :mark_as_not_done_button, ".toggle-task-done"
    element :task_list_container, '.tasks-list > mat-list-item'
    element :task_list, '.tasks-list'

    def verify_if_i_am_on_page(page_name)
      case page_name
        when "Tasks"
          task_title.text == page_name
      end
    end


    def verify_if_task_is_created_successfully(list_of_task)
      list_of_task.each do |task|
        task_name_to_search = get_name_for_the_task(task[0]).downcase
        verify_if_the_task_name_is_found(task_name_to_search)
      end
    end

    def verify_if_the_task_name_is_found(task_name_to_search)
      find(:xpath, "//*[@class='task-#{task_name_to_search} ng-star-inserted']")
    end

    def click_on_button_for_a_task(button_name, task_name)
      task_name_to_verify = get_name_for_the_task(task_name)
      task_container = verify_if_the_task_name_is_found(task_name_to_verify.downcase)
      case button_name
        when "View"
          task_container.find_all(:xpath, '//*[@class="mat-button-wrapper"]')[1].click
        when "Mark as done"
          task_container.find_all(:xpath, '//*[@class="mat-button-wrapper"]')[2].click
        when "Mark as not done"
          task_container.find_all(:xpath, '//*[@class="mat-button-wrapper"]')[2].click
        when "Add Task"
          verify_if_we_have_add_task_done_button
      end
    end

    def get_parsed_task_details(task_name_to_fetch)
      @data = Utils.get_task_details
      return @data[task_name_to_fetch]
    end

    def get_name_for_the_task(task_reference)
      @data = Utils.get_task_details
      return @data[task_reference]["TASK_NAME"]
    end

    def get_description_for_the_task(task_reference)
      @data = Utils.get_task_details
      return @data[task_reference]["TASK_DESCRIPTION"]
    end

    def get_priority_for_the_task(task_reference)
      @data = Utils.get_task_details
      return @data[task_reference]["PRIORITY"]
    end


    def verify_if_task_is_deleted_successfully(task_details)
      begin
        task_list_container.displayed?
      rescue Capybara::ElementNotFound
        true
      end
    end

    def verify_if_we_have_list_page_buttons(button_name)
      case button_name
        when "View"
          verify_if_we_have_mark_as_done_button
        when "Mark as done"
          verify_if_we_have_mark_as_done_button
        when "Mark as not done"
          verify_if_we_have_mark_as_not_done_button
        when "Add Task"
          verify_if_we_have_add_task_done_button
      end
    end

    def click_on_buttons_on_task_list_page(button_name)
      case button_name
        when "View"
          view_button.click
        when "Mark as done"
          mark_as_done_button.click
        when "Mark as not done"
          mark_as_not_done_button.click
        when "Add Task"
          add_task_button.click
        when "Submit"
          find('.add-task-submit').click
        when "View Task"
          click_link("tasks")
        when "Delete"
          delete_task.click

      end
    end

    private
    def verify_if_we_have_view_button
      view_button.visible?
    end

    def verify_if_we_have_mark_as_done_button
      mark_as_done_button.visible?
    end

    def verify_if_we_have_add_task_done_button
      add_task_button.visible?
    end

    def verify_if_we_have_mark_as_not_done_button
      mark_as_not_done_button.visible?
    end



  end
end
