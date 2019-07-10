defmodule Botiful.Render do
  alias ChromeRemoteInterface.RPC

  def page(url) do
    pid = ChroxyClient.page_session!(%{host: "localhost", port: 1330 })

    {:ok, _res} = RPC.Page.navigate(pid, %{
      url: url
    })

    :timer.sleep(2000)

    {:ok, result} = RPC.Runtime.evaluate(pid, %{
      expression: "document.documentElement.outerHTML"
    })

    result["result"]["result"]["value"]
  end
end
