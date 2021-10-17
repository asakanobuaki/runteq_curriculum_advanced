# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Rails.rootを使用するために必要 config/environment.rbを取り込む。
# 記載しないとNameError: uninitialized constant #<Class:#<Whenever::JobList:...>>::Railsエラーが出る。
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
# ENV['RAILS_ENV'] = nilの時:developmentを代入。
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"
# --silentオプションを外す
job_type :rake, 'cd :path && :environment_variable=:environment bundle exec rake :task :output'

every 1.hours do
  rake 'article_state:update_article_state'
end

every 1.day, at: '9am' do
  rake 'article_summary:mail_report_summary'
end
