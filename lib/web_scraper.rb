# 外部ファイルを読み込む
require_relative 'get_heatstroke_alert'
require_relative 'judge_wbgt'
require_relative 'post_heatstroke_message_notification'

class WebScraper
  # get_heatstroke_alert メソッドをトリガーにして、次のメソッドを呼び出す
  def self.perform_task
    # get_heatstroke_alert メソッドの実行
    alert_data = GetHeatstrokeAlert.execute

    # judge_wbgt メソッドを呼び出し、その結果を次のメソッドに渡す
    wbgt_result = JudgeWbgt.evaluate(alert_data)

    # post_heatstroke_message_notification メソッドを呼び出す
    PostHeatstrokeMessageNotification.notify(wbgt_result)
  end
end