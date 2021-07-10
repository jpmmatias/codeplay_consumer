class Enrollment
  attr_reader :price, :student, :course

  def initialize(price:, student:, course:)
    @price = price
    @student = student
    @course = course
  end

  def self.all
    response = Faraday.get 'http://localhost:3000/api/v1/enrollments'

    enrollments = JSON.parse(response.body, symbolize_names: true)

    enrollments.map do |enrollment|
      new(price: enrollment[:price], student: enrollment[:student], course: enrollment[:course])
    end
  end
end
