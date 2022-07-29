class TaskFormatter < Struct.new(:task)
  def initialize(task)
    @task = task
  end

  def task
    @task
  end

  def format
    @task.complete? ? "- [x] #{@task.title}" : "- [ ] #{@task.title}"
  end
end