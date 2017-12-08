defmodule Triary.DiaryState do

  def message(state) do
    case state do
      :worst  ->
        # {:best, "今日あった一番悪かったことを教えてください。"}
        {:best,"週末なにしていますか？"}
      :best ->
        # {:try, "今日あった一番良かったことを教えてください。"}
        {:try, "忙しいですか？"}
      :try   ->
        # {:worst, "明日頑張ることを教えてください。"}
        {:worst, "ふくもく会来てもらっていいですか？"}
    end
  end
end
