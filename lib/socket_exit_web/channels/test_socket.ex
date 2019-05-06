defmodule SocketExit.TestSocket do
  @behaviour Phoenix.Socket.Transport

  defstruct child_pid: nil

  require Logger

  @impl true
  def child_spec(_) do
    # We won't spawn any process, so let's return a dummy task
    %{id: __MODULE__, start: {Task, :start_link, [fn -> :ok end]}, restart: :transient}
  end

  @impl true
  def connect(map) do
    {:ok, nil}
  end

  @impl true
  def init(nil) do
    {:ok, child_pid} = SocketExit.Server.start_link()
    {:ok, %__MODULE__{child_pid: child_pid}}
  end

  @impl true
  def handle_in({payload, opts}, state) do
    {:ok, state}
  end

  @impl true
  def handle_info(_, state) do
    {:ok, state}
  end

  def handle_message(payload, state) do
    Logger.debug("unhandled message: #{inspect(payload)}")
    {:ok, state}
  end

  @impl true
  def terminate(reason, state) do
    # Process.exit(state.child_pid, reason)
    {:exit, state}
  end
end

