require 'sqlite3'
class Task
  def initialize(task_params)
    @description = task_params["description"]
    @title       = task_param["title"]
    @database = SQLite3::Database.new('db/task_manager_development.db')
    @database.results_as_hash = true
  end
end
