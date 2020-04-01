defmodule SherlockApiWeb.RestrictWordView do
  use SherlockApiWeb, :view

  def render("index.json", %{restrict_words: restrict_words}) do
    %{results: render_many(restrict_words, SherlockApiWeb.RestrictWordView, "single.json")}
  end

  def render("single.json", %{restrict_word: restrict_word}) do
    %{
      uuid: restrict_word.uuid,
      word: restrict_word.word
    }
  end
end
