namespace :article_state do
  desc '公開日を過ぎた記事を公開する'
   task update_article_state: :environment do
    Article.publish_wait.past_published.find_each(&:published!)
   end
end
