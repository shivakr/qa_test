# module Pages
#
#   class CommonPages < SitePrism::Page
#
#
#   include Pages
#
#   def verify_if_we_have_the_button(button_name)
#     case button_name
#       when "Add Task"
#         expect(add_task_button.visible?).to eq true
#       when "View Tasks"
#         expect(find_link('tasks').visible?).to eq true
#     end
#   end
#
#   def click_on_button(button_name)
#     case button_name
#       when "Add Task"
#         add_task_button.click
#       when "View Tasks"
#         click_link('tasks')
#       when "Submit"
#         task_submit_button.click
#     end
#   end
#
#   end
# end
