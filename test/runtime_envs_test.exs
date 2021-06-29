defmodule RuntimeEnvsTest do
  use ExUnit.Case
  doctest RuntimeEnvs

  test "greets the world" do
    assert RuntimeEnvs.hello() == :world
  end
end
