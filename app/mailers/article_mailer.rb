class ArticleMailer < ApplicationMailer
  def report_summary
    @published_article_count = Article.published.count
    @published_article_yesterday = Article.published_yesterday
    mail(to: 'admin@example.com',
         subject: '公開済記事の集計結果')
  end
end
