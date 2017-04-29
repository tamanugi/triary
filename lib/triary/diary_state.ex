defmodule Triary.DiaryState do

  def message(state) do
    case state do
      :worst  ->
        {:best, "今日あった一番悪かったことを教えてください。"}
      :best ->
        {:try, "今日あった一番良かったことを教えてください。"}
      :try   ->
        {:worst, "明日頑張ることを教えてください。"}
    end
  end
end
