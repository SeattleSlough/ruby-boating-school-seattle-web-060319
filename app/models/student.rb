require 'pry'

class Student
@@all = []

attr_accessor :first_name

def initialize(name)
  @first_name = name
  @@all.push(self)
end

def self.all
  @@all
end

def add_boating_test(test, status, instructor)
  new_test = BoatingTest.new(self, test, status, instructor)
end

def self.find_student(first_name)
  @@all.select {|student| student.first_name == first_name}
end

def grade_percentage
  tests = BoatingTest.all.select {|test| test.student == self}
  passed = tests.select {|test| test.status == "passed"}
  return (passed.length/tests.length).to_f
end

end
