# IN  配列
# OUT 配列
# # アラートメッセージ通知処理
require_relative "date_formatter"
class PostHeatstrokeMessageNotification
  # インデックス
  WBGT_TIME = 0
  WBGT_VALUE = 1
  WBGT_ALART = 2
  WBGT_MSG = 3

  def self.notify(wbgt_result)
    # 日付フォーマット読込
    formatted_date = DateFormatter.formatted_date

    messages = []
    messages.unshift("【熱中症警戒アラートが発表されました！ #{formatted_date} #{wbgt_result[WBGT_TIME]}時(最新) 】\n")
    messages << " 【暑さ指数(WBGT): #{wbgt_result[WBGT_VALUE]}   警戒レベル: #{wbgt_result[WBGT_ALART]} 】"
    messages << wbgt_result[WBGT_MSG]
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'] do
      defaults channel: "##{ENV['CHANNEL']}", username: "通知BOT"
    end

    # Slackに通知するメッセージ
    notifier.ping messages.join("\n")
  end
end