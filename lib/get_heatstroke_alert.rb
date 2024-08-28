  require 'nokogiri'
  require 'time'
  # IN なし
# OUT float型の数値
# 熱中症アラートデータの取得処理
class GetHeatstrokeAlert
  
  def self.execute
    
    # スクレイピング処理
    agent = Mechanize.new
    url = "https://www.wbgt.env.go.jp/day_list.php?region=03&prefecture=44&point=44132"
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)
    
    # 現在の時刻を取得
    current_hour = Time.now.hour
    
    # 現在の時刻と1時間前の時刻を設定
    current_time = current_hour
    previous_time = current_hour - 1
    
    alert_data = nil
    
    # 対象ページのtrの要素を全て取得し、rows配列に格納する
    rows = doc.search('tr')
    
    # 時間とwbgt値を返すためのハッシュを生成
    # alert_data = {time: "", wbgt: 0.0}
    
    # 1時から24時までの各行（row）を確認し、最終的に取得できているwbgt値をリターンする
    rows.each do |row|
      
      # ループで順番が来たrowのtdの値4つを取得しcells配列に格納する
      cells = row.search('td')
      
      next if cells.empty?
      
      # cells配列の先頭の要素は時刻であるため、timeにcellsの0番目の要素をセットする
      time = cells[0].text.strip.to_i
      
      # 時間が現在時刻又は1時間前に一致する場合、wbgt値取得
      if time == current_time  || time == previous_time
        wbgt_cells = cells.find { |cell| cell['class'].to_s.start_with?('asc_body wbgt_lv') }
        
        if wbgt_cells
          wbgt_value = wbgt_cells.text.strip.to_f # フロート型に変換
          alert_data = { time: time.to_s, wbgt: wbgt_value } # アラートデータを代入
        end
        
      end
      
    end
    
    # 最終的に取得できているwbgt値が空の場合、-1を返す
    alert_data ||= {time: previous_time.to_s, wbgt: -1.0}
    
    # 取得結果をリターン
    return alert_data
    
  end
end