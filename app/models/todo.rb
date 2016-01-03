class Todo < ActiveRecord::Base
  belongs_to :parent, class_name: "Todo", foreign_key: "parent_id"
  has_many :children, class_name: "Todo", foreign_key: "parent_id"
  validates :title, presence: true, length: { minimum: 2 }
end
