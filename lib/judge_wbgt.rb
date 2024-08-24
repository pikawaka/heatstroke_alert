# IN float型の数値
# OUT 配列
# WBGT 判定処理
class JudgeWbgt
  def self.evaluate(alert_data)
    # [配列定義]
    wbgt_result = []
    # [TODO: 定数で警告(WARNING、ATTENTION、CRITICALなど)を定義]
    # [TODO: 定数でメッセージを定義 ※茂野さん担当]
    # [TODO: WBGT 判定処理]
    wbgt_result << "処理結果" #判定結果(WARNING、ATTENTION、CRITICALなど)を配列に入れる
    wbgt_result << alert_data #引数を文字型変換して配列に入れる
    wbgt_result << "メッセージ" #メッセージを配列に入れる
    logger.info("Evaluated WBGT from alert data: #{wbgt_result}")
    # 配列で返却
    # データ構造例: ["WARNING", "32.5", "熱中症警報が発令されました。外出は控えてください"]
    return wbgt_result
  end
end