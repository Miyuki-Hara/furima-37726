class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #emailはdeviseのデフォルト設定で必須かつ＠を含むことになっているので両者に関するバリデーションは省略
  validates :nickname, presence: true
  validates :email,    uniqueness: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true,  format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  #passwordはdeviseのデフォルト設定で必須、６~128文字、確認用は一致かつ空欄不可のため前述事項に関するバリデーションは省略
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'Include both letters and numbers'

end
