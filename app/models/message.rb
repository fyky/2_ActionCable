class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  #無記入投稿とエンター長押し連続投稿を防ぐ
  #validates :text, presence: true
  #MessageBroadcastJobを走らせるタイミングはMessageがcreateされた後
  after_create_commit {MessageBroadcastJob.perform_later self}
end
