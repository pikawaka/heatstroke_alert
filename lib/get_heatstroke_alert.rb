# IN なし
# OUT float型の数値
# 熱中症アラートデータの取得処理
class GetHeatstrokeAlert
  def self.execute
    # スクレイピング処理
    alert_data = "[#float型の数値をセット]"
    logger.info("Fetched heatstroke alert data: #{alert_data}") # ログ出力
    # [TODO: float型で返却]
    return alert_data
  end
end