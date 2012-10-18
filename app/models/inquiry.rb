class Inquiry < ActiveRecord::Base
  attr_accessible :description, :title, :data
  attr_accessor :data
  after_save :save_file

  private
  def save_file
    if data
      File.open("#{Rails.root}/public/images/#{self.id}.jpg", "w+") do |f|
        f.write Base64.decode64(data).force_encoding('UTF-8')
      end
    end
  end
end
