defmodule Botiful do
  @moduledoc """
  Documentation for Botiful.
  """

  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, :ok, "world")
  end

  match(_, do: send_resp(conn, :not_found, "not found"))
end
