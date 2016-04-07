class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :register_number, presence: true

  def to_param
    "#{id} #{name}".parameterize
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end
end
