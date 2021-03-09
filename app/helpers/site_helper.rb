module SiteHelper
  def msg_jumbotron
    case params[:action]
      when 'index'
        "Últimas perguntas cadastradas:"
      when 'questions'
        "Resultados para o termo \"#{sanitize params[:term]}\"..."
      when 'subject'
        subject = Subject.find(params[:subject_id])
        "Filtrando pelo assunto: \"#{sanitize subject.description}\"..."
    end
  end
end
