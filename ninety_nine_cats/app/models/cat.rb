# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ['red', 'black', 'white', 'orange', 'green', 'yellow']
  
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "Not a valid color" } 
  validates :sex, inclusion: { in: %w(F M), message: "Please choose F or M" }
  
  def age
    # debugger
    time_ago_in_words(birth_date)
  end
   
end
