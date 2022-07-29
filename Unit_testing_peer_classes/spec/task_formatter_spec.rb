require "task_formatter"

RSpec.describe do
    context "completed or incompleted task" do
      it "returns the correct format of a task depending on the above" do
        task = double :Task, title: "Clean", mark_complete: true,
               complete?: true
        task_formatter = TaskFormatter.new(task)
        expect(task_formatter.format).to eq "- [x] Clean"
      end
    end

    it "returns task" do
      task_formatter = TaskFormatter.new("Task")
      expect(task_formatter.task).to eq "Task"
    end
  end