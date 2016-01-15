class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #regex = /\d{10}/
  #validates :mobile_number, format: { with: regex, message: "bad format" }
#  validates :mobile_number, :phone_number => {:ten_digits => true}
  has_many :papers
  validates_presence_of :first_name, :last_name, :mobile_number, :college_name, :designation
end
