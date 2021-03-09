class Question < ApplicationRecord
  searchkick

  belongs_to :subject, counter_cache: true
  has_many :answers, inverse_of: :question
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :set_statistic

  # Kaminari
  paginates_per 5

  scope :search_subject, ->(page, subject_id){
    includes(:answers, :subject)
    .where(subject_id: subject_id)
    .page(page)
  }

  scope :_search_, ->(page, term){
    includes(:answers, :subject)
    .where("description LIKE ?", "%#{term}%")
    .page(page)
  }

  scope :last_questions, -> (page){
    includes(:answers, :subject)
    .order(['created_at desc'])
    .page(page)
  }

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end
end
