
namespace :article_summary do
  desc '管理者に対して総記事数、昨日公開された記事件数とタイトルをメールで送信'
    task mail_report_summary: :environment do
      ArticleMailer.report_summary.deliver_now
    end
end