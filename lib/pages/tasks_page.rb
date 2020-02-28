module Pages
   class AddTaskPage < SitePrism::Page
     set_url "/add-task"

     element :name, '#mat-input-0'
     element :description, '#mat-input-1'
     element :priority,'#mat-select-0'
     element :due_date, '#mat-input-2'
     element :submit_button, '.add-task-submit'
     element :task_list_container, '.tasks-list > mat-list-item'

     element :task_details_title, ".task-name"
     element :task_details_description, ".description"
     element :task_details_priority, ".priority"
     element :task_details_due_date, ".due-date"
     element :task_details_task_done_status, ".done"

     def get_list_of_tasks
       task_list_container.each do |elem|
         p elem['class']
       end
     end


     def fill_task_details(number_of_tasks, table)
       @data = table.hashes
       name.set "#{@data[0]['name']}"
       description.set "#{@data[0]['description']}"
       priority.click
       find(".mat-option-text", text: "#{@data[0]['priority']}").click
       due_date.set "#{@data[0]['due_date']}"
       return true
     end


     def get_string_of_length(length=300)
       source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
       key=""
       length.times{ key += source[rand(source.size)].to_s }
       return key
     end



   end
end