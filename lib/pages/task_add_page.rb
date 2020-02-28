module Pages
  class TaskAddPage < SitePrism::Page
    set_url "/add-task"

    include RSpec::Matchers

    #Dynamic changing and inconsistent identifiers are defined as class variable

    @@task_name = "//*[@formcontrolname='name']"
    @@task_description = "//textarea[@formcontrolname='description']"
    @@task_priority = "//*[@formcontrolname='priority']"
    @@task_due_date = "//input[@formcontrolname='dueDate']"




    # Site Prism usage
    element :add_task_title, ".add-new-task-title"
    element :task_submit_button, '.add-task-submit'
    element :add_task_button,'.add-task'
    element :task_name, '#mat-input-0'
    element :task_description, "//textarea[@formcontrolname='description']"



    def verify_if_we_have_all_the_fields(list_of_filed_in_task_add_page)
      page.should have_content(add_task_title.text)
      list_of_filed_in_task_add_page.each do |field_name|
        case field_name.downcase
          when "name"
            expect(find(:xpath, @@task_name).visible?).to eq true
          when "description"
            expect(find(:xpath, @@task_description).visible?).to eq true
          when "priority"
            expect(find(:xpath, @@task_priority).visible?).to eq true
          when "due_date"
            expect(find(:xpath, @@task_due_date).visible?).to eq true
        end
      end
    end

    def enter_task_name(name_of_the_task)
      find(:xpath, @@task_name).set name_of_the_task
    end

    def enter_task_description(description_text)
      find(:xpath, @@task_description).set description_text
      # task_description.set description_text
    end

    def select_task_priority(priority_to_be_set)
      find(:xpath, @@task_priority).click
      # task_priority.click
      find(".mat-option-text", text: "#{priority_to_be_set}").click
    end

    def set_due_date(due_date_to_be_set)
      find(:xpath, @@task_due_date).set "#{due_date_to_be_set}"
      # task_due_date.set "#{due_date_to_be_set}"
    end

    def verify_if_i_am_on_the_page(page_name)
      add_task_title.text == page_name
    end

    def add_a_task()
      @data = Utils.get_task_details
      p @data["Email"]
    end

    def verify_if_i_am_on_page(page_name)
      case page_name
        when "Tasks"
          task_title.text == page_name
      end
    end


    def verify_if_we_have_the_button(button_name)
      case button_name
        when "Add Task"
          expect(add_task_button.visible?).to eq true
        when "View Tasks"
          expect(find_link('tasks').visible?).to eq true
        when "View"

      end
    end

    def click_button_on_add_task_page(button_name)
      case button_name
        when "Add Task"
          add_task_button.click
        when "View Tasks"
          click_link('tasks')
        when "Submit"
          task_submit_button.click

      end
    end

    def enter_the_required_task_details(number_of_tasks=1, list_of_tasks)
      for i in 0..number_of_tasks-1 do
        if i > 0
          binding.pry
          add_task_button.click
        end
        type_of_task_details= list_of_tasks[i][0]
        fill_the_add_task_details_for(type_of_task_details)
        i+=1
      end


    end

    def fill_the_add_task_details_for(type_of_task_details)
      @data = Utils.get_task_details
      @task_data = @data[type_of_task_details]

      #Enters the required tas info
      enter_task_name(@task_data["TASK_NAME"])
      enter_task_description(@task_data["DESCRIPTION"])
      select_task_priority(@task_data["PRIORITY"])

      #Date set to tomorrow, so that its not hardcoded and anytime we run tests, date is taken care
      @due_date=Chronic.parse('tomorrow').strftime("%m/%d/%y")
      set_due_date(@due_date)

      #clicks Submit button to save the task
      task_submit_button.click


    end

  end
end