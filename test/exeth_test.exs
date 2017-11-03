defmodule ExethTest do
  use ExUnit.Case
  doctest Exeth

  test "greets the world" do
    assert Exeth.hello() == :world
  end
end
