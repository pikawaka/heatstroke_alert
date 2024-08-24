# IN  配列
# OUT 配列
# # アラートメッセージ通知処理
class PostHeatstrokeMessageNotification
  def self.notify(messages)
    messages.unshift("【熱中症警戒アラートが発表されました】\n")
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'] do
      defaults channel: "#宮嶋コーポレーション", username: "通知BOT"
    end

    # Slackに通知するメッセージ
    notifier.ping messages.join("\n")
  end
end