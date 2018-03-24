defmodule OthelloWeb.GamesChannel do
  use OthelloWeb, :channel

  def join("games:"<> name, payload, socket) do
    game = Othello.GameBackup.load(name) || Othello.Game.new()
    socket = socket
    |> assign(:game, game)
    |> assign(:name, name)

    if authorized?(payload) do
      {:ok, %{"game" => Othello.Game.client_view(game)}, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (games:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("handleClickByServer", %{"num" => num}, socket) do
     game0 = Othello.GameBackup.load(socket.assigns[:name])
     if(game0 == nil) do
       game0 = Othello.Game.new()
     end
     game = Othello.Game.handleClickByServer(game0,num)
     Othello.GameBackup.save(socket.assigns[:name], game)
     socket = assign(socket, :game, game)
     broadcast socket, "reload:view", game
     {:reply, {:ok, %{ "game" => Othello.Game.client_view(game)}}, socket}
  end
  #def handle_in("handleTimeOut", %{"game" => game}, socket) do
  #  game0 = socket.assigns[:game]
  #  game1 = Game.handleTimeOut(game0)
  #  Othello.GameBackup.save(socket.assigns[:name], game1)
  #  socket = assign(socket, :game, game1)
   # {:reply, {:ok, %{"game" => Game.client_view(game1)}}, socket}
  #end
  def handle_in("restartFn",%{}, socket) do
    game0 = socket.assigns[:game]
    game1 = Othello.Game.handlerestart(game0)
    Othello.GameBackup.save(socket.assigns[:name], game1)
    socket = assign(socket, :game, game1)
    {:reply, {:ok, %{"game" => Othello.Game.client_view(game1)}}, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
  def handle_info({:after_click}, socket) do
    game = Othello.GameBackup.load(:name)
    #Memory.GameBackup.save(socket.assigns[:name], game)
    #IO.puts("click func")
    broadcast socket, "reload:view", %{game: game}
    {:noreply, socket}
  end

end
