# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# 30分ごとに実行されるバッチジョブの設定
# whenever を使ってcronジョブを更新するには、以下のコマンドを実行
# whenever --update-crontab
every 30.minutes do
  # 定期実行したい処理をrunner後にファイル指定
  # runner "WebScraper.perform_task"
end