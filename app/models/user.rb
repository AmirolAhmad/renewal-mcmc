class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

 attr_writer :login

 has_one :profile, dependent: :destroy

 before_create :build_default_profile

 validates :ic_number, presence: :true, uniqueness: { case_sensitive: false }
 validate :validate_ic_number

 def login
   @login || self.ic_number || self.email
 end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
     where(conditions).where(["lower(ic_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
     if conditions[:ic_number].nil?
       where(conditions).first
     else
       where(ic_number: conditions[:ic_number]).first
     end
    end
  end

  def validate_ic_number
    if User.where(email: ic_number).exists?
      errors.add(:ic_number, :invalid)
    end
  end

  private

    def build_default_profile
      build_profile
      true
    end
end
