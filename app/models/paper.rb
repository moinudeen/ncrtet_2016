class Paper < ActiveRecord::Base
  belongs_to :user
  has_attached_file :paper_version1
  has_attached_file :paper_version2
  do_not_validate_attachment_file_type :paper_version1
	do_not_validate_attachment_file_type :paper_version2
  validates_presence_of :paper_tile, :abstract, :type_of_conference, :paper_version1
end
