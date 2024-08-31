module DateFormatter
  def self.formatted_date
    # 本日日付を取得
    today = Date.today

    # 曜日の日本語表示用のハッシュ（キーはシンボル）
    day_names = {
      Monday:    '月',
      Tuesday:   '火',
      Wednesday: '水',
      Thursday:  '木',
      Friday:    '金',
      Saturday:  '土',
      Sunday:    '日'
    }
    # 曜日を英語で取得
    weekday_english = today.strftime('%A').to_sym

    # 日本語の曜日に変換
    weekday_japanese = day_names[weekday_english]

    # フォーマット出力
    # 2024年8月27日(火)
    return "#{today.year}年#{today.month}月#{today.day}日(#{weekday_japanese})"
  end
end