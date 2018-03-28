defmodule Othello.GameBackup do
    use Agent
  #Attribution: Professor class notes
    def start_link do
      Agent.start_link(fn -> %{} end, name: __MODULE__)
    end
  
    def save(name, game) do
      Agent.update __MODULE__, fn state ->
        Map.put(state, name, game)
      end
    end
  
    def load(name) do
      Agent.get __MODULE__, fn state ->
        Map.get(state, name)
      end
    end
    def getAll() do
      Agent.get __MODULE__, fn state ->
        Map.keys(state)
      end
    end
    def delete(name) do
      Agent.get_and_update __MODULE__, fn state ->
        Map.pop(state,name)
      end
    end
     
end 