# module CommonPage
#
#   include ::Common
#
# end
# World(Common)

module StorePages

  include ::Pages
  # include ::Common

  def list_tasks_page
    @current_page = ListTasksPage.new
  end

  def tasks_details_page
    @current_page = TaskDetailsPage.new
  end

  def task_add_page
    @current_page = TaskAddPage.new
  end
  def sign_in_page
    @current_page = SignInPage.new
  end

  def home_page
    @current_page = HomePage.new
  end

  def tasks_page
    @current_page = AddTaskPage.new
  end

  # def common_page
  #   @current_page = CommonPage.new
  # end

  def registration_page
    @current_page = RegistrationPage.new
  end

  def profile_page
    @current_page = MyProfilePage.new
  end

  def blogs_page
    @current_page = BlogPage.new
  end

  def connections_page
    @current_page = ConnectionsPage.new
  end

  def groups_page
    @current_page = GroupsPage.new
  end

  def messages_page
    @current_page = MessagesPage.new
  end

  def notifications_page
    @current_page = NotificationsPage.new
  end

  def favourites_page
    @current_page = FavouritesPage.new
  end

  def gmail_account
    @gmail_account = GmailClass.new
  end

  def email_verify_page
    @current_page = VerifyEmailAddress.new
  end

  def profile_update_page
    @current_page = ProfileUpdate.new
  end

  def all_groups_page
    @current_page = AllGroupsPage.new
  end

  def settings_page
    @current_page = SettingsPage.new
  end

  def add_group_page
    @current_page = AddGroupPage.new
  end

  def forum_page
    @current_page = ForumPage.new
  end

  def events_page
    @current_page = EventsPage.new
  end

  def analytics_page
    @current_page = AnalyticsPage.new
  end

  def ideas_page
    @current_page = IdeasPage.new
  end

  def library_page
    @current_page = LibraryPage.new
  end

  def reports_page
    @current_page = ReportsPage.new
  end

  def wiki_page
    @current_page = WikiPage.new
  end

  def members_page
    @current_page = MembersPage.new
  end

  def group_page
    @current_page = GroupPage.new
  end

  def group_settings_page
    @current_page = GroupSettingsPage.new

  end

  def web_service
    @http_web_service = WebApi.new

  end
end

World(StorePages)

module Waiter

  def await
    sleep(5.0)
  end

  def wait_for_url(url,timeout=60)
    for i in 1..timeout
      sleep 5
      break if @current_page.current_url == url
    end
  end

end

World(Waiter)