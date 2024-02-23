defmodule PhoenixAppWeb.PageLive do
  use PhoenixAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0, form: to_form(%{default_amount: 10}))}
  end

  def greeting(assigns) do
    ~H"""
    Welcome to the Phoenix Live View
    """
  end

  # Create an even for add
  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("subtract", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number - 1)}
  end

  def handle_event("adding_more", %{"add_amount" => the_added_amount}, socket) do
    # Handle empty value with case and return 0
    input_value = case Integer.parse(the_added_amount) do
      {number, _} -> number
      :error -> 0
    end
    {:noreply, assign(socket, number: socket.assigns.number + input_value, form: to_form(%{default_amount: the_added_amount}))}
  end
end
