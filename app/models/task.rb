require 'sqlite3'
class Task
  attr_reader :title, :description
  def initialize(task_params)
    @title       = task_params["title"]
    @description = task_params["description"]
    @database = SQLite3::Database.new('db/task_manager_development.db')
    @database.results_as_hash = true # overrides default of returning rows as arrays
  end

  def save
    @database.execute("INSERT INTO tasks (title, description) VALUES (?, ?);", @title, @description)
  end

  def self.all
    database = SQLite3::Database.new('db/task_manager_development.db')
    database.results_as_hash = true
    tasks = database.execute("SELECT * FROM tasks")
    tasks.map do |task|
      Task.new(task)
    end
  end
end
