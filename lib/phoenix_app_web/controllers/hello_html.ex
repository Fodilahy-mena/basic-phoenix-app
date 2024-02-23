defmodule PhoenixAppWeb.HelloHTML do
  use PhoenixAppWeb, :html

  # def index(assigns) do
  #   ~H"""
  #   Hello
  #   """
  # end

  embed_templates "hello_html/*"
end
