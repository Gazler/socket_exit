defmodule SocketExit.Server do
  use GenServer

  @keepalive_timeout 1_000

  def start_link() do
    GenServer.start_link(__MODULE__, [], [])
  end

  def init(_opts) do
    {:ok, nil, @keepalive_timeout}
  end

  @doc false
  def handle_info(:timeout, _data) do
    IO.inspect({:keepalive, :server})
    {:noreply, nil, @keepalive_timeout}
  end

  @impl true
  def terminate(reason, _data) do
    IO.inspect reason
  end
end

