class Scraping
  def self.get_urls
    # 映画の個別ページのURLを取得する
    # 個別ページへのリンクを入れる変数
    links = []
    # 次ページのURLを入れる変数
    next_url = ""
    agent = Mechanize.new do |a|
      a.follow_meta_refresh = true
      a.keep_alive = false
    end

    while true do
      #今のページの処理
      current_page = agent.get("http://review-movie.herokuapp.com/" + next_url)
      elements = current_page.search(".entry-title a")
      elements.each do |ele|
        links << ele[:href]
      end

      #次へ のタグを取得
      next_link = current_page.at(".pagination .next a")
      #無ければwhileを抜ける
      break unless next_link
      # タグからhrefを取得
      next_url = next_link[:href]
    end

    # linksそれぞれをget_productに渡し、呼び出す
    links.each do |link|
      get_product("http://review-movie.herokuapp.com/" + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new do |a|
      a.follow_meta_refresh = true
      a.keep_alive = false
    end

    page  = agent.get(link)
    title = page.at('.post h2').inner_text
    body  = page.at('.entry-content p').inner_text if page.at('.entry-content p')

    post         = Post.where(title: title).first_or_initialize
    post.body    = body
    post.user_id = rand(3) + 1
    post.save
  end
end
