class Site::SearchController < SiteController
  def questions
    @questions = Question.search(params[:term], page: params[:page], per_page: 5)
  end
  def subject
    @questions = Question.search_subject(params[:page], params[:subject_id])
  end
end
