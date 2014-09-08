class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :screenname, presence: true
  validates :screenname, :uniqueness => { case_sensitive: false }

  before_save :create_slug  

  def name
      [first_name, last_name].join(" ")
  end


  private

  def create_slug
    slug = screenname.downcase.gsub(/\s/, '-')
    self.slug = slug
    return slug
  end

end