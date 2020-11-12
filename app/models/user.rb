class User < ApplicationRecord
  before_save { self.email.downcase! } #User インスタンス（レコード）を保存するその前に、self.email.downcase! を実行する(文字を全て小文字に変換する)
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
end
