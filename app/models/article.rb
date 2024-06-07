class Article < ApplicationRecord
    validates :title, presence: true, length: { maximum: 10 }
    validates :content, presence: true
  
    # Active Storageを使用して画像ファイルを扱うための関連を追加する
    has_one_attached :image_file
  end
  