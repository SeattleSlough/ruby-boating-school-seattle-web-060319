
require'pry'
class Instructor
  attr_accessor :name, :status
  @@all = []

  def initialize(name)
    @name = name
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def pass_student(student, name)
    pass_target = BoatingTest.all.find {|test| test.student == student && test.test == name}
    if pass_target
      pass_target.status = "passed"
    else
      BoatingTest.new(student, name,"failed", self)
    end
  end

  def fail_student(student, name)
    fail_target = BoatingTest.all.find {|test| test.student == student && test.test == name}
    if fail_target
      fail_target.status = "failed"
    else
      BoatingTest.new(student, name,"failed", self)
    end
  end
end
