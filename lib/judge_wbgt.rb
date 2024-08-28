# 定義ファイルの読み込み
require_relative 'constants'

# IN time(string型,フォーマット:HH24)とwbgt(float型)のハッシュ
# OUT string型配列[time,risk(危険度),wbgt,message]
class JudgeWbgt
  def self.evaluate(alert_data)
    
    # モジュールの呼び出し
    include Constants
    
    wbgt_result = []
    wbgt_result << alert_data[:time]
    
    if 31.0 <= alert_data[:wbgt]
      wbgt_result << DANGER
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << DANGER_MESSAGE
    elsif 28.0 <= alert_data[:wbgt] && alert_data[:wbgt] < 31.0
      wbgt_result << HIGH_ALERT
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << HIGH_ALERT_MESSAGE
    elsif 25.0 <= alert_data[:wbgt] && alert_data[:wbgt] < 28.0
      wbgt_result << WARNING
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << WARNING_MESSAGE
    elsif 21.0 <= alert_data[:wbgt] && alert_data[:wbgt] < 25.0
      wbgt_result << ATTENTION
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << ATTENTION_MESSAGE
    elsif 0.0 <= alert_data[:wbgt] && alert_data[:wbgt] < 21.0
      wbgt_result << SAFETY
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << SAFETY_MESSAGE
    end
    
    # WBGT値取得に失敗した場合
    if alert_data[:wbgt] == -1
      wbgt_result << WBGT_ERROR
      wbgt_result << alert_data[:wbgt].to_s
      wbgt_result << WBGT_ERROR_MESSAGE
    end
    
    return wbgt_result
  end
end