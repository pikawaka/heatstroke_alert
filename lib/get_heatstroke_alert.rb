# IN なし
# OUT float型の数値
# 熱中症アラートデータの取得処理
require 'nokogiri'
require 'time'
class GetHeatstrokeAlert
  def self.execute
    # 解析対象のURLを設定
    url = "https://www.wbgt.env.go.jp/day_list.php?region=03&prefecture=44&point=44132"

    # Mechanizeオブジェクトを作成し、指定したURLからページを取得
    agent = Mechanize.new
    page = agent.get(url)

    # NokogiriでHTMLを解析するため、ページのHTMLを取得
    doc = Nokogiri::HTML(page.body)

    # 現在の時間を取得
    current_hour = Time.now.hour

    # 現在の時間と1時間前の時間を設定
    current_time = current_hour
    previous_time = current_hour - 1

    # WBGT値を格納するための変数を初期化
    wbgt_result = nil

    # テーブルの行を取得
    rows = doc.search('tr')

    # 各行をループして処理
    rows.each do |row|
      cells = row.search('td')  # 各行のセルを取得
      next if cells.empty?     # セルが空の場合はスキップ

      # 時間のセルを取得し、整数に変換
      time = cells[0].text.strip.to_i

      # 現在の時間または前の時間が一致する場合に処理
      if time == current_time || time == previous_time
        # WBGT値が存在するセルを探す
        wbgt_cell = cells.find { |cell| cell['class'].to_s.start_with?('asc_body wbgt_lv') }

        # WBGT値が見つかった場合
        if wbgt_cell
          # WBGT値を浮動小数点数に変換
          wbgt_value = wbgt_cell.text.strip.to_f
          wbgt_result = { time: time.to_s, wbgt: wbgt_value }
          break  # 見つかったらループを終了
        end
      end
    end

    # データが見つからなかった場合のデフォルト値を設定
    wbgt_result ||= { time: (current_hour - 1).to_s, wbgt: -1.0 }

    # 最終的な結果を返す
    return wbgt_result
  end
end