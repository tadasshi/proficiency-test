require 'rails_helper'

# RSpec.describe Student, :type => :model do
#   it "should add a Student instance" do
#     Student.new.should == {}
#   end
# end
describe "views/students/show.html.haml",:type => :view, formats: :html, handlers: :haml do
  context "should show a student" do
    let(:student) { build :student, name: 'student name', register_number: '589.589-85' }

    it "render student" do
      render student
      expect(rendered).to have_content 'student name'
    end
  end
end