class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reservations, :through => :listings
  has_many :trips, :foreign_key => 'guest_id', :class_name => "Reservation"
  has_many :reviews, :foreign_key => 'guest_id'
  has_many :guests, class_name: "User", through: :reservations
  has_many :booked_trips, through: :trips, source: :listing
  has_many :hosts, through: :booked_trips, foreign_key: 'host_id'
  has_many :host_reviews, through: :guests, source: :reviews

end
