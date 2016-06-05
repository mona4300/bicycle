class Item < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  enum style: [ :style1, :style2, :style3 ]

  validates :name, :style, :price, :photo, :description,  presence: true

  filterrific(
    default_filter_params: { sort_desc: true },
    available_filters: [
      :sort_desc,
      :name_contains,
      :with_style,
      :price_min,
      :price_max
    ]
  )

  scope :sort_desc, -> (flag) {
    method = flag ? :desc : :asc
    order(created_at: method)
  }
  scope :name_contains, -> (name) { where("name LIKE ?", "%#{name}%") }
  scope :with_style, -> (style) { where(style: Item.styles[style]) }
  scope :price_min, -> (price) { where("price >= ?", price) }
  scope :price_max, -> (price) { where("price <= ?", price) }
end
