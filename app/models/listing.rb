class Listing < ActiveRecord::Base 
has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg", :storage => :s3, :s3_region => "eu-west-1", :s3_host_name => 's3-{eu-west-1}.amazonaws.com', :s3_credentials => Proc.new{|a| a.instance.s3_credentials } 

validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 

def s3_credentials 
	{:bucket => "dcu-fyp", :access_key_id => ENV["ACCESS_KEY_ID"] %>, :secret_access_key => ENV["SECRET_ACCESS_KEY"]} 
		
	end 
end