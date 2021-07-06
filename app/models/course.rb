class Course
  attr_reader :name, :description, :instructor

  def initialize(name:, description:, instructor:)
    @name = name
    @description = description
    @instructor = instructor
  end

  def self.all
    response = Faraday.get 'http://localhost:3000/api/v1/courses'
    courses = JSON.parse(response.body, symbolize_names: true)
    courses.map do |course|
      new(name: course[:name], description: course[:description],
          instructor: course[:instructor])
    end
  rescue Faraday::ConnectionFailed
    []
  end
end