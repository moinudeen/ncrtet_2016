class Paper < ActiveRecord::Base
  belongs_to :user
  has_attached_file :paper_version1,
	:storage => :dropbox,
	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	:dropbox_visibility => 'public'
  has_attached_file :paper_version2,
	:storage => :dropbox,
	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	:dropbox_visibility => 'public'
  do_not_validate_attachment_file_type :paper_version1
	do_not_validate_attachment_file_type :paper_version2
end
