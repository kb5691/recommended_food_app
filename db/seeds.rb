# ログイン時に使用する「メールアドレス」と「パスワード」
email = "test@example.com"
password = "password"

# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

# 初期データ
user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

food1 = user2.foods.create!(name: "沖縄そば",
                            comment: "沖縄そばとは、小麦粉100%にかん水を加えてつくる沖縄固有の沖縄固有の麺であり、原料と製法から、中華麺に属します。
                    起源は、中国にある「琉球交流史」に、1534年に琉球王の四十九日供養に「粉湯（中国語で、汁そばの意味）」を献上したとあるのが原形だとされています。")
food2 = user1.foods.create!(name: "ゴーヤーチャンプルー", comment: "「ゴーヤーチャンプルー」は豆腐、豚肉、ゴーヤーなどを炒めた料理で沖縄県の郷土料理です。
  ゴーヤーの苦味と具材や出汁の甘味のコントラストが食欲を刺激し、夏バテ防止にも一役買う暑い沖縄ならではの料理です。")
food3 = user3.foods.create!(name: "海ぶどう", comment: "海ぶどうはクビレズタという海藻の一種で、果物のぶどうの房の形に似ていることから名付けられたそうです。
  プチプチとしたキャビアのような触感が特徴で「グリーンキャビア」とも呼ばれています。")
food4 = user3.foods.create!(name: "タコライス",
                            comment: "タコライスとはメキシコ風アメリカ料理であるタコスの具材をご飯の上に乗せた料理です。
                    「タコス」とご飯の「ライス」の2つの言��が合わさってタコライスとなりました。
                    タコスはメキシコやアメリカにルーツのある料理ですが、タコライスは沖縄県にて1980年ごろに生まれた料理です。
                    沖縄がアメリカの統治下にあった際に、アメリカ軍によってタコスが沖縄に持ち込まれ、ご飯と結びついたとされています")
food5 = user1.foods.create!(name: "サーターアンダギー",
                            comment: "全国的に沖縄県のお菓子、おやつとして知名度が高いのが「サーターアンダーギー」で、小麦粉を卵、砂糖と合わせてこねて油で揚げた沖縄風のドーナツのこと。
                    揚げることで生地の片側が割れ、チューリップの花が咲いたような形になるのが特徴。")

food1.likes.create!(user_id: user1.id)
food1.likes.create!(user_id: user3.id)
food2.likes.create!(user_id: user2.id)
food3.likes.create!(user_id: user1.id)
food4.likes.create!(user_id: user1.id)
food4.likes.create!(user_id: user2.id)
food5.likes.create!(user_id: user3.id)

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"
