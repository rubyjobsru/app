xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'
xml.rss version: '2.0' do
  xml.channel do
    xml.title t('layouts.application.meta_title')
    xml.description t('layouts.application.meta_description')
    xml.link vacancies_url
    xml.language('ru-ru')

    feed_vacancies.each do |vacancy|
      xml.item do
        xml.title "#{vacancy.title}. #{company_location_tag(vacancy)}"
        xml.description vacancy.short_description
        xml.pubDate vacancy.created_at.to_s(:rfc822)
        xml.link vacancy_url(vacancy)
        xml.guid vacancy_url(vacancy)
      end
    end
  end
end
