# /lib/constants.rb
module Constants
  DANGER = "DANGER!!!"
  HIGH_ALERT = "HIGH_ALERT!!"
  WARNING = "WARNING!"
  ATTENTION = "ATTENTION!"
  SAFETY = "SAFETY"
  WBGT_ERROR = "WBGT_ERROR!!"
  REF_URL = "https://www.wbgt.env.go.jp/wbgt.php#:~:text=暑さ指数（WBGT（湿,提案された指標です%E3%80%82"

  DANGER_MESSAGE = <<-"EOS"
  危険！WBGTが31度以上です。熱中症のリスクが非常に高いです。外出を避け、涼しい場所で過ごしてください。必ず水分補給を行い、体調に十分注意してください。
 【参照サイト】
  #{REF_URL}
  EOS

  HIGH_ALERT_MESSAGE = <<-"EOS"
  厳重警戒！WBGTが28度以上31度未満です。熱中症のリスクが高いです。外出時は十分な水分補給と涼しい場所の確保を心掛けてください。体調に注意を払いましょう。
 【参照サイト】
  #{REF_URL}
  EOS

  WARNING_MESSAGE = <<-"EOS"
  警戒！WBGTが25度以上28度未満です。暑さによる体調不良に注意が必要です。水分補給を怠らず、涼しい環境で過ごすよう心掛けてください。
 【参照サイト】
  #{REF_URL}
  EOS

  ATTENTION_MESSAGE = <<-"EOS"
  注意！WBGTが21度以上25度未満です。暑さの影響がありますが、リスクは比較的低いです。水分補給を怠らず、体調に気を付けてください。外出時には軽く体を冷やすことをお勧めします。
 【参照サイト】
  #{REF_URL}
  EOS
  SAFETY_MESSAGE = <<-"EOS"
  ほぼ安全！WBGTが21度未満です。暑さの影響はほとんどありませんが、基本的な水分補給を続け、体調を整えてください。特に問題はありませんが、体調管理をしっかり行いましょう。
 【参照サイト】
  #{REF_URL}
  EOS

  WBGT_ERROR_MESSAGE = "WBGT値の取得に失敗しました。"
end